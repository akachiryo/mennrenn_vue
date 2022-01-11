class RoomSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :content
end
