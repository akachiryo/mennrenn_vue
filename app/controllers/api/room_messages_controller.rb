class Api::RoomMessagesController < ApplicationController

  def index
  end

  def create
    message = current_user.room_messages.new(room_message_params)
    if message.save!
    else
    end
  end

  def destroy
  end

  private
  def room_message_params
    params.require(:room_messages).permit(:room_id, :message)
  end

end
