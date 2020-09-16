class CartsController < ApplicationController

  def create
    @product = Product.find(params[:id])
    @cart.add(@product)
    redirect_to cart_path
  end

  def update
    @product = Product.find(params[:id])
    @cart.add(@product)

    respond_to do |format|
      format.html { redirect_to cart_path }
    end
  end

  def remove_item
    @product = Product.find(params[:id])
    @cart.remove(@product, 1)

    respond_to do |format|
      format.html { redirect_to cart_path }
    end
  end

end
