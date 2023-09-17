class HospitalsController < ApplicationController
  before_action :set_hospital , only: [:update, :destroy, :show]
  before_action :check_admin, only: [:create, :update, :destroy]
  
  def index
    hospitals = Hospital.all
    render json: hospitals
  end
  
  def show
    render json: @hospital
  end
  
  def search_hospital_name
    name = params[:name]
    hospital = Hospital.where("name LIKE ?","%#{name}%")
    render json: hospital
  end
  
  def create
    hospital = @current_user.hospitals.new(hospital_params)
    if hospital.save 
      render json: hospital, status: :created
    else
      render json: { errors: hospital.errors.full_messages}, status: :unprocessable_entity   
    end
  end
  
  def update
    if @current_user.id == @hospital.user_id
      if @hospital.update(hospital_params)
        render json: @hospital
      else
        render json: { errors: @hospital.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {message: "You're not the authorized admin for this hospital"}
    end
  end
  
  def destroy
    if @hospital.destroy
      render json: {message: "Hospital Successfully Deleted"}
    else
      render json: {message: "Something Went Wrong"}
    end
  end
  
  private
  def set_hospital
    @hospital = Hospital.find(params[:id])
  end
  
  def hospital_params
    params.permit(
      :name,
      :location,
      :user_id,
      :image
    )
  end
end
