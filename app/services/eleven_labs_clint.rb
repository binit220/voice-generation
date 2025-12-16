class ElevenLabsClint
  BASE_URL = "https://api.elevenlabs.io/v1/text-to-speech"

  def self.generate(text)
    response = Faraday.post(BASE_URL) do |req|
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

    response
  end
end