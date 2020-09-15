class WishlistsController < ApplicationController
  before_action :set_wishlist, only: [:show, :update, :destroy]
  
  def index
    @wishlists = Wishlist.all

    render json: @wishlists
  end

  def show

  end

  def create

  end

  def update

  end

  def destroy

  end

private

  def set_wishlist
    @wishlist = Wishlist.find(params[:id])
  end

end
