class CartProductsController < ApplicationController

  def create
    cart_item = CartProduct.create(cart_id: params[:cart_id], product_id: params[:product_id], counter: params[:products_add])
    cart = Cart.find(params[:cart_id])

    redirect_to cart
  end

  def update
    @cart_product = CartProduct.find_by(product_id: params[:product_id], cart_id: params[:cart_id])
    counter = @cart_product.counter + params[:products_add]
    @cart_product.update(counter: counter)

    redirect_to cart
  end
end
