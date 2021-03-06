class Tag < ApplicationRecord
  has_many :rooms, through: :room_tags
  has_many :room_tags, dependent: :destroy
  
  validates :name, presence: true, uniqueness: true
end
