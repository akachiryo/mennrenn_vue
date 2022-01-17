class Api::UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    render json: user, serializer: UserSerializer
  end
  
  def create
    user = User.new(user_params)
    user.save!
    render json: user, status: :created, serializer: UserSerializer
  end

  def update
    current_user.update(user_update_params)
    render json: current_user, serializer: UserSerializer
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def user_update_params
    params.require(:user).permit(:name, :introduction, :avatar)
  end
end
