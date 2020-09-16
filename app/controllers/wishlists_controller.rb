class WishlistsController < ApplicationController
  before_action :set_wishlist, only: [:show, :update, :destroy]

  def index
    @wishlists = Wishlist.all

    render json: @wishlists
  end

  def show
    render json: @wishlist
  end

  def create
    @wishlist = Wishlist.new(wishlist_params)

  end

  def update
    if @wishlist.update(wishlist_params)
      render json: { msg: "Wishlist updated!"}
    else
      render json: @wishlist.errors, status: :unprocessable_entity
    end

  end

  def destroy
    wishlist = Wishlist.delete(params[:id])
    render json: wishlist

  end

private

  def set_wishlist
    @wishlist = Wishlist.find(params[:id])
  end

  def wishlist_params
    params.require(:product).permit(:name, :price)

  end

end
