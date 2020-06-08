class DeliveryMethodsController < ApplicationController

  def new
    @order = Order.find(params[:order_id])
  end

  def create
    order = Order.find(params[:order_id])
    order.update(delivery_method_id: delivery_method_id)

    redirect_to new_order_payment_method_path(order.id)
  end

  private

  def delivery_method_id
    # params.permit(:delivery_method_id)[:delivery_method_id].to_i
    params[:delivery_method_id].to_i
  end
end
