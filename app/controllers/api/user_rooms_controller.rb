class Api::UserRoomsController < ApplicationController
  def create
    user_room = current_user.user_rooms.new(user_room_params)
    if user_room.save!
      room = current_user.rooms.where(id: user_room.room_id)
      room.update(is_full: true)
    else
      redirect_to request.referer
    end
  end

  def destroy
  end

  private

  def user_room_params
    params.require(:user_room).permit(:room_id)
  end
end
