require "rails_helper"

RSpec.describe VoiceGeneration, type: :model do
  it "is valid with valid attributes" do
    vg = build(:voice_generation)
    expect(vg).to be_valid
  end

  it "belongs to a user" do
    vg = build(:voice_generation, user: nil)
    expect(vg).not_to be_valid
  end

  it "has enum statuses" do
    expect(VoiceGeneration.statuses.keys)
      .to include("pending", "processing", "completed", "failed")
  end
end
