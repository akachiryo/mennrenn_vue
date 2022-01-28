class Api::RoomsController < ApplicationController
  
  before_action :authenticate, only: [:create, :update, :destroy]
  PER_PAGE = 9
  
  def index
    # search_rooms_form = SearchRoomsForm.new(search_params)
    # rooms = search_rooms_form.search.order(created_at: :desc).page(params[:page]).per(PER_PAGE)
    # render json: rooms, each_serializer: RoomSerializer,
    # meta: { total_pages: rooms.total_pages,
    #         total_count: rooms.total_count,
    #         current_page: rooms.current_page }
    # rooms = Room.all.order(created_at: :desc)
    # render json: rooms, each_serializer: RoomSerializer
    rooms = Room.order(created_at: :desc).page(params[:page]).per(PER_PAGE)
    render json: rooms, each_serializer: RoomSerializer, meta: { total_pages: rooms.total_pages,
                                                                 total_count: rooms.total_count,
                                                                 current_page: rooms.current_page }, adapter: :json
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
      current_user.user_rooms.create(room_id: room.id)
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

  def search_params
    params[:q]&.permit(:title, tag_ids: [])
  end
end
