class Api::RoomsController < ApplicationController
  
  before_action :authenticate, only: [:create, :update, :destroy]
  
  def index
    rooms = Room.all.order(created_at: :desc)
    render json: rooms, each_serializer: RoomSerializer
  end
  
  def show
    room = Room.find(params[:id])
    render json: room, serializer: RoomSerializer
  end
  
  def new
  end
  
  def edit
  end
  
  def create
    room = current_user.rooms.new(room_params)
    if room.save!
      render json: room, status: :created, serializer: RoomSerializer
    else
      render :new
    end
  end

  def update
    room = current_user.rooms.find(params[:id])
    room.update!(room_params)
    render json: room, serializer: RoomSerializer
  end
  
  def destroy
    room = current_user.rooms.find(params[:id])
    room.destroy!
    render json: room, serializer: RoomSerializer
  end
  
  private

  def room_params
     params.require(:room).permit(:title, :content)
  end
end
