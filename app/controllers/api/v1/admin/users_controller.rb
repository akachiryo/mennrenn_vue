class Api::V1::Admin::UsersController < ApplicationController
  def index
    user = User.all
    render json: user, each_serializer: UserSerializer
  end

  def show
    user = User.find(params[:id])
    render json: user, serializer: Userserializer
  end
end
