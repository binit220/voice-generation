Voice Generation API (Rails)

A Ruby on Rails application that converts text to speech using the ElevenLabs API.
Audio generation runs asynchronously in background jobs and generated audio files
are stored on Cloudinary. The app includes a simple UI to generate, track, and play
voice outputs.


Features

Text-to-speech generation using ElevenLabs
Asynchronous processing using ActiveJob
Cloudinary storage for generated audio
Status polling (pending → processing → completed/failed)
Audio playback directly in the browser
History of generated audio requests per user
Simple Bootstrap-based UI


Tech Stack

Ruby 3.x
Rails 7.x
ActiveJob
ElevenLabs API
Cloudinary
RSpec
Bootstrap

---
API Endpoints

POST `/api/generate_voice`

Creates a voice generation request.

{
  "voice_request": {
    "text": "Hello world"
  }
}

Response

json
Copy code
{
  "id": 12,
  "status": "pending"
}
GET /api/voice_requests
Returns the list of voice generation requests for the current user.

GET /api/voice_requests/:id
Returns the status and audio URL for a specific request.

Environment Variables

ELEVENLABS_API_KEY=your_api_key
CLOUDINARY_CLOUD_NAME=your_cloud_name
CLOUDINARY_API_KEY=your_api_key
CLOUDINARY_API_SECRET=your_api_secret
