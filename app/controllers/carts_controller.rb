class CartsController < ApplicationController

  def update
    @cart = Cart.find(params[:id])
    @cart.products << Product.find(params[:cart][:product_id])
    redirect_to @cart
  end

  def show
    @cart = Cart.find(params[:id])
  end
end
