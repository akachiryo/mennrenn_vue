class Room < ApplicationRecord
  has_many :room_messages, dependent: :destroy
  has_many :user_rooms, dependent: :destroy
  has_many :room_tags, dependent: :destroy
  has_many :tags, through: :room_tags
  belongs_to :user

  scope :by_title, ->(title) { where('title LIKE ?', "%#{title}%") }
  scope :by_tag, ->(tag_ids) { joins(:room_tags).where(room_tags: { tag_id: tag_ids }) }

end
