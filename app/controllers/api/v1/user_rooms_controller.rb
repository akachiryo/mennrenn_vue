class Api::V1::UserRoomsController < ApplicationController

  def index
      user_rooms = current_user.user_rooms.reverse
      render json: user_rooms, each_serializer: UserRoomSerializer
  end

  def create
    if current_user.user_rooms.where(room_id: params[:user_room][:room_id]).empty?
      user_room = current_user.user_rooms.new(user_room_params)
      if user_room.save!
        room = Room.where(id: user_room.room_id)
        room.update(is_full: true)
      else
        redirect_to request.referer
      end
    end
  end

  def destroy
  end

  private

  def user_room_params
    params.require(:user_room).permit(:room_id)
  end
end
