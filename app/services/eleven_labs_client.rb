class ElevenLabsClient
  BASE_URL = "https://api.elevenlabs.io/v1/text-to-speech"
  VOICE_ID = "EXAVITQu4vr4xnSDxMaL"

  def self.generate(text)
    Faraday.post("#{BASE_URL}/#{VOICE_ID}") do |req|
      req.headers["xi-api-key"] = ENV["ELEVENLABS_API_KEY"]
      req.headers["Content-Type"] = "application/json"

      req.body = {
        text: text,
        voice_settings: {
          stability: 0.5,
          similarity_boost: 0.5
        }
      }.to_json
    end
  end
end
