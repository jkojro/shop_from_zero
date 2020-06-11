class Orders::PaymentMethodsController < ApplicationController

  def new
    @order = Order.find(params[:order_id])
  end

  def create
    @order = Order.find(params[:order_id])
    @order.update(payment_method_id: payment_method_id)

    redirect_to @order
  end

  private

  def payment_method_id
    params[:payment_method_id].to_i
  end
end
