class GenerateVoiceJob < ApplicationJob
  queue_as :default

  def perform(voice_generation_id)
    vg = VoiceGeneration.find_by(id: voice_generation_id)
    return unless vg

    start_time = Time.current
    vg.update!(status: :processing)

    response = ElevenLabsClient.generate(vg.text)

    unless response.success?
      vg.update!(status: "failed", error_message: response.body)
      return
    end

    tmp_path = Rails.root.join("tmp", "voice_#{vg.id}.mp3")

    File.open(tmp_path, "wb") { |f| f.write(response.body) }

    audio_url = AudioStorageService.upload(
      tmp_path,
      "voice_generations/#{vg.id}"
    )

    vg.update!(
      status: :completed,
      audio_url: audio_url,
      processing_time: Time.current - start_time
    )

  rescue => e
    vg&.update(status: "failed", error_message: e.message)
    Rails.logger.error(e)
  ensure
    File.delete(tmp_path) if tmp_path && File.exist?(tmp_path)
  end
end
