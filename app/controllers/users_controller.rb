class UsersController < ApplicationController
  skip_before_action :authenticate_user, except: [:show, :update]
  before_action :check_admin, only:[:update, :destory]
  
  def index
    users = User.all
    render json: users
  end
  
  def show
    render json: @current_user
  end
  
  def create
    user = User.new(user_params)
    if user.save 
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages}, status: :unprocessable_entity   
    end 
  end
  
  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: user
    else
      render json: user.errors.full_messages
    end
  end
  
  def destroy
    user = User.find(params[:id])
    if user.destroy
      render json: {message: "User Successfully Deleted"}
    else
      render json: {message: "Something Went Wrong"}
    end
  end
  
  private
  def user_params
    params.permit(
      :email,
      :password,
      :role,
      :name,
      :image
    )
  end
end
