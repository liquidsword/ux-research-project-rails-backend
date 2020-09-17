class RatingsController < ApplicationController

  def index
    @ratings = Rating.all

  end

  def show
    rating = Rating.find_by(id: params[:id])
    render json: { rating: product.rating, product: product}
  end

  def new
    @rating = Rating.new
  end

  def create
    rating = Rating.new(review_params)

    if rating.valid?
      rating.save
      render json: { msg: "Rating added!"}
    else
      render json: { error: "Rating couldn't be added."}
    end
  end

  def update
    rating = Rating.find_by(id: params[:id])

    if rating.valid?
      rating.update(rating_params)
      render json: { msg: "Rating has been updated!"}
    else
      render json: { error: "Update unsuccessful!"}

    end
  end

  def destroy
    rating = Rating.delete( params[:id])
    render json: rating

  end

private
  def rating_params
    params.require(:rating).permit(:product_id, :score)

  end
end
