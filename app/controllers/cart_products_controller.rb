# frozen_string_literal: true

class CartProductsController < ApplicationController
  # before_action :validate_items_number

  def create
    shopping_cart.add_item(
      product_id: params[:product_id],
      quantity: params[:number_to_add]
    )
    
    # cart_product = CartProduct.create(
    #   cart_id: cart_product_params[:cart_id],
    #   product_id: cart_product_params[:product_id],
    #   counter: cart_product_params[:number_to_add]
    # )

    redirect_to cart_path
  end
  #
  # def update
  #   cart_product = CartProduct.find(params[:id])
  #   result = UpdateCartProductCounter.new(cart_product).call(cart_product_params)
  #   if result.success?
  #     flash[:notice] = result.success
  #     redirect_to cart_product.cart
  #   else
  #     flash[:notice] = result.failure
  #     redirect_back(fallback_location: product_path(id: cart_product_params[:product_id]))
  #   end
  # end

  private
  #
  # def cart_product_params
  #   params.require(:cart_product).permit(:cart_id, :product_id, :number_to_add).to_h
  # end

  # def validate_items_number
  #   result = Validators::CartProductValidator.new.call(cart_product_params)
  #
  #   if result.failure?
  #     flash[:notice] = result.errors.to_h.map { |_, v| v.first }.join
  #
  #     redirect_back(fallback_location: product_path(id: cart_product_params[:product_id]))
  #   end
  # end
end
