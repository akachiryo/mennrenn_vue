class UserRoomSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :user,  serializer: UserSerializer
  belongs_to :room,  serializer: RoomSerializer
end
