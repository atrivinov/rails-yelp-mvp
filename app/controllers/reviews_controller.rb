class ReviewsController < ApplicationController
  # GET /restaurants/new
  def new
    @restaurant = Restaurant.find(params[:restaurant_id]) # Debo encontrar el id
    # del restaurante al cual le crearemos la review
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(restaurant_params)

    if @review.save
      redirect_to @restaurant, notice: "Review was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  # Only allow a list of trusted parameters through.
  def restaurant_params
    params.require(:review).permit(:content, :rating)
  end
end
