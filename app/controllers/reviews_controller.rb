class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :update, :destroy]
  def index
    reviews = Review.all
    render json: reviews
  end
  
  def show
    render json: @review
  end
  
  def create
    review = @current_user.reviews.new(review_params)
    if review.save 
      render json: review, status: :created
    else
      render json: { errors: review.errors.full_messages}, status: :unprocessable_entity   
    end
  end
  
  def update
    if @review.update(review_params)
      render json: @review
    else
      render json: { errors: @review.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  def destroy
    if @review.destroy
      render json: {message: "Review Successfully Deleted"}
    else
      render json: {message: "Something Went Wrong"}
    end
  end
  
  def set_review
    @review = Review.find_by(id: params[:id])
  end
  
  private
  def review_params
    params.permit(
      :feedback,
      :reviewable_id,
      :reviewable_type,
      :user_id
    )
  end
end
