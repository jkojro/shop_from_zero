# frozen_string_literal: true

class CartProductsController < ApplicationController
  before_action :validate_items_number

  def create
    cart_product = CartProduct.create(
      cart_id: cart_product_params[:cart_id],
      product_id: cart_product_params[:product_id],
      counter: cart_product_params[:number_to_add]
    )

    redirect_to cart_product.cart
  end

  def update
    cart_product = CartProduct.find(params[:id])
    counter = cart_product.counter + cart_product_params[:number_to_add].to_i
    cart_product.update(counter: counter)

    redirect_to cart_product.cart
  end

  private

  def cart_product_params
    params.require(:cart_product).permit(:cart_id, :product_id, :number_to_add)
  end

  def validate_items_number
    if cart_product_params[:number_to_add].to_i > 5
      flash[:notice] = 'Dodałeś zbyt wiele sztuk produktu'
      redirect_back(fallback_location: product_path(id: cart_product_params[:product_id]))
    end
  end
end
