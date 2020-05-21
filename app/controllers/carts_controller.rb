# frozen_string_literal: true

class CartsController < ApplicationController

  def update
    if cart_params_contract.success?
      shopping_cart.update_quantities(cart_params_contract)
      flash[:notice] = 'Cart updated'
    else
      flash[:notice] = cart_params_contract.errors.to_h.map { |_, v| v.first }.join
    end

    redirect_to cart_path
  end

  def show; end

  def destroy
    shopping_cart.clear

    redirect_to root_path
  end

  private

  def cart_params_contract
    result = ShoppingCart::UpdateCartContract.new.call(request.parameters.deep_symbolize_keys)
  end
end
