class RoomSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :content,
             :is_full,
             :created_at,
             :updated_at

  has_many :tags
  belongs_to :user
end
