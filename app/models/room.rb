class Room < ApplicationRecord
  has_many :room_messages, dependent: :destroy
  has_many :user_rooms, dependent: :destroy
  has_many :room_tags, dependent: :destroy
  has_many :tags, through: :room_tags
  belongs_to :user

  scope :by_title, ->(title) { where('title LIKE ?', "%#{title}%") }
  scope :by_tag, ->(tag_ids) { joins(:room_tags).where(room_tags: { tag_id: tag_ids }) }

  def save_with_tags!(tag_names:)
    return save! if tag_names.nil?

    ActiveRecord::Base.transaction do
      self.tags = tag_names.map { |name| Tag.find_or_initialize_by(name: name) }
      save!
    end
    true
  rescue StandardError => e
    false
  end

end
