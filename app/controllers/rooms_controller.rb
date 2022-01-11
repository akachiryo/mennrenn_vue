class RoomsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    room = currenr_user.rooms.new(room_params)
    if room.save!
      render json: room, status: :created, serializer: RoomSerializer
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end
  
  private

  def room_params
     params.require(:room).permit(:title, :content)
  end
end
