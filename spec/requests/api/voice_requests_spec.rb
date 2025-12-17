require "rails_helper"

RSpec.describe "Voice Requests API", type: :request do
  let(:user) { create(:user) }

  before do
    host! "localhost"

    allow_any_instance_of(ApplicationController)
      .to receive(:current_user)
      .and_return(user)
  end

  it "creates a voice generation request" do
    post "/api/generate_voice",
      params: {
        voice_request: { text: "Hello world" }
      }.to_json,
      headers: { "CONTENT_TYPE" => "application/json" }

    expect(response).to have_http_status(:ok)
  end

  it "lists voice generations" do
    create(:voice_generation, user: user)

    get "/api/voice_requests"

    expect(response).to have_http_status(:ok)
  end
end
