require "rails_helper"

RSpec.describe GenerateVoiceJob, type: :job do
  let(:vg) { create(:voice_generation) }

  let(:fake_response) do
    double(
      success?: true,
      body: "FAKE_AUDIO_BINARY"
    )
  end

  before do
    allow(ElevenLabsClient)
      .to receive(:generate)
      .and_return(fake_response)

    allow(AudioStorageService)
      .to receive(:upload)
      .and_return("https://cloudinary.com/fake.mp3")
  end

  it "processes voice generation successfully" do
    described_class.perform_now(vg.id)

    vg.reload
    expect(vg.status).to eq("completed")
    expect(vg.audio_url).to be_present
  end
end
