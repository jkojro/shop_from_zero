# frozen_string_literal: true

class CartsController < ApplicationController

  def update
    shopping_cart.update_quantities(cart_params)

    redirect_to cart_path
  end

  def show; end

  def destroy
    shopping_cart.clear

    redirect_back(fallback_location: @cart)
  end

  private

  def cart_params
    params.permit(items: {})
  end
end
