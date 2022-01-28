class RoomTag < ApplicationRecord
  belongs_to :room
  belongs_to :tag

  validates :room_id, uniqueness: { scope: :tag_id }
end
