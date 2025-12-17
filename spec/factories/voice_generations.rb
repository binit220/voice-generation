FactoryBot.define do
  factory :voice_generation do
    text { "Hello world" }
    status { "pending" }
    user
  end
end
