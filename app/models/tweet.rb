class Tweet < ApplicationRecord
  belongs_to :user
  validates :message, presence: true, length: { maximum: 240 }
end
