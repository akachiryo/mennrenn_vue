class Api::V1::Admin::UsersController < ApplicationController
  def index
    users = User.all
    render json: users, each_serializer: UserSerializer
  end

  def show
    user = User.find(params[:id])
    render json: user, serializer: Userserializer
  end

  def destroy
    user = User.find(params[:id])
    user.destroy!
  end
end
