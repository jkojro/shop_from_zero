class DeliveryMethodsController < ApplicationController

  def new
    binding.pry
    @order = Order.find(params[:order_id])

    render 'delivery_methods/new'
  end

  def create
    order = Order.find(params[:order_id])
    order.update(delivery_method_id: params[:delivery_method_id])

    redirect_to new_order_payment_method_path(@order.id)
  end
end
