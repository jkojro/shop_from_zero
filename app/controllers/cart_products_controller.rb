# frozen_string_literal: true

class CartProductsController < ApplicationController
  def create
    result = shopping_cart.add_item(
      product_id: params[:product_id],
      quantity: params[:number_to_add]
    )

    if result.success?
      redirect_to cart_path
    else
      flash[:notice] = result.failure

      redirect_back(fallback_location: product_path(params[:product_id]))
    end
  end
end
