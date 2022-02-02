class Api::RoomsController < ApplicationController
  
  before_action :authenticate, only: [:create, :update]
  PER_PAGE = 9
  
  def index
    search_rooms_form = SearchRoomsForm.new(search_params)
    rooms = search_rooms_form.search.order(created_at: :desc).page(params[:page]).per(PER_PAGE)
    render json: rooms, each_serializer: RoomSerializer, meta: { total_pages: rooms.total_pages,
                                                                 total_count: rooms.total_count,
                                                                 current_page: rooms.current_page }, adapter: :json
  end
  
  def show
    room = Room.find(params[:id])
    render json: room, serializer: RoomSerializer
  end
  
  def create
    room = current_user.rooms.new(room_params)
    room.assign_attributes(room_params)
    if room.save_with_tags!(tag_names: tag_names)
      current_user.user_rooms.create(room_id: room.id)
      render json: room, serializer: RoomSerializer
    else
      render :new
    end
  end

  def update
    room = current_user.rooms.find(params[:id])
    room.assign_attributes(room_params)
    room.save_with_tags!(tag_names: tag_names)
    render json: room, serializer: RoomSerializer
  end
  
  def destroy
    room = Room.find(params[:id])
    room.destroy!
    render json: room, serializer: RoomSerializer
  end
  
  private

  def room_params
     params.require(:room).permit(:title, :content)
  end

  def search_params
    params[:q]&.permit(:title, tag_ids: [])
  end

  def tag_names
    params.dig(:room, :tag_names)
  end
end
