class Api::UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    render json: user, serializer: UserSerializer
  end
  
  def create
    logger.debug("create入りました")
    user = User.new(user_params)
    user.save!
    render json: user, status: :created, serializer: UserSerializer
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
