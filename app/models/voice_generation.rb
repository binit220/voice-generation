class VoiceGeneration < ApplicationRecord
  belongs_to :user

  enum status: {
    pending: 0,
    processing: 1,
    completed: 2,
    failed: 3,
  }, _default: 0
end
