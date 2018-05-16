class ReviewsController < ApplicationController
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = @restaurant.reviews
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])

    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    @review.save

    redirect_to @restaurant
  end

  private
  def review_params
    params.require(:review).permit(:name, :address, :category)
  end
end

