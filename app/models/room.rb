class Room < ApplicationRecord
  has_many :room_messages, dependent: :destroy
  has_many :user_rooms, dependent: :destroy
  belongs_to :user

  validates :content, presence: true, length: { maximum: 140 }
end
