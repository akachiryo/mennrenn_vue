class Api::RoomMessagesController < ApplicationController

  def index
    messages = RoomMessage.where(room_id: 35).order(created_at: :desc).limit(10).reverse
    render json: messages, each_serializer: RoomMessageSerializer
  end

  def create
    message = current_user.room_messages.new(room_message_params)
    if message.save!
      render json: message, serializer: RoomMessageSerializer
      
    else
    end
  end

  def destroy
  end

  private
  def room_message_params
    params.require(:room_message).permit(:room_id, :content)
  end

end
