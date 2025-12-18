class VoiceGeneration < ApplicationRecord
  belongs_to :user

  validates :text, presence: true, length: { maximum: 5_000 }
  validates :status, presence: true
  validates :audio_url, presence: true, if: :completed?
  validates :error_message, presence: true, if: :failed?

  enum status: {
    pending: 0,
    processing: 1,
    completed: 2,
    failed: 3,
  }, _default: 0
end
