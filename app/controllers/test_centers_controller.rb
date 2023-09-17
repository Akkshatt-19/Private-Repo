class TestCentersController < ApplicationController
  before_action :set_test_center,only: [:destory, :update, :show]
  before_action :check_sub_admin, only: [:test_center_through_sub_admin]
  before_action :check_permission, only: [:create, :update, :destory]
  
  def index
    test_centers = TestCenter.all
    render json: test_centers
  end
  
  def show
    render json: @test_center
  end
  
  def search_name
    name = params[:name]
    test_center = TestCenter.where("name LIKE ?","%#{name}%")
    render json: test_center
  end
  
  def search_location
    location = params[:location]
    test_center = TestCenter.where("location LIKE ?","%#{location}%")
    render json: test_center
  end
  
  def create
    test_center = @current_user.test_centers.new(test_center_params)
    if test_center.save 
      render json: test_center, status: :created
    else
      render json: { errors: test_center.errors.full_messages}, status: :unprocessable_entity   
    end
  end
  
  def update
    if @test_center.update(test_center_params)
      render json: @test_center
    else
      render json: { errors: @test_center.errors.full_messages}, status: :unprocessable_entity
    end
  end
  
  def destroy
    if @test_center.destroy
      render json: {message: "Test Center Successfully Deleted"}
    else
      render json: {message: "Something Went Wrong"}
    end
  end
  
  def set_test_center
    @test_center = TestCenter.find_by(id: params[:id])
  end
  
  private
  def test_center_params
    params.permit(
      :name,
      :hospital_id,
      :location
    )
  end
end
