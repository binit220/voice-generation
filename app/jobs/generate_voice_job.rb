class GenerateVoiceJob < ApplicationJob
  queue_as :default

  def perform(voice_generate_id)
    vg = VoiceGeneration.find_by(id: voice_generate_id)
    if vg
      vg.update!(status: "processing")
    else
      render json: { error: "Voice generation not found" }
    end

    response = ElevenLabsClint.generate(vg.text)

    if response.success?
      audio_file = response.body
      # url = StorageService.upload(audio_file)

      vg.update( status: "completed", audio_url: url )
    else
      vg.update( status: "failed", error_message: response.body )
    end
  rescue => e
    vr.update(status: "failed", error_message: e.message)
  end
end
