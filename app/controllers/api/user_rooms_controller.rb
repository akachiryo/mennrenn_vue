class Api::UserRoomsController < ApplicationController
  def create
    user_room = current_user.user_rooms.new(user_room_params)
    if user_room.save!
      if UserRoom.select(room_id: user_room.room_id).length == 2
         
      end
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
