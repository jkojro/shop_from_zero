# frozen_string_literal: true

class CartsController < ApplicationController

  def update
    binding.pry
    result = UpdateCart.new(@cart).call(cart_params: cart_params)
    flash['alert'] = result.failure if result.failure?

    redirect_to @cart
  end

  def show; end

  def destroy
    @cart.products.destroy_all

    redirect_back(fallback_location: @cart)
  end

  private


  def cart_params
    params.require(:cart).permit(:product_id, :products_add, products_attributes: %i[id products_number])
  end
end
