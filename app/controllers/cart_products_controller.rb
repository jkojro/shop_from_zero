# frozen_string_literal: true

class CartProductsController < ApplicationController

  def create
    shopping_cart.add_item(
      product_id: params[:product_id],
      quantity: params[:number_to_add]
    )
    
    redirect_to cart_path
  end
end
