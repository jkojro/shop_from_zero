class OrdersController < ApplicationController

  def new
    @order = Order.new
    @address = Address.new(order_id: @order.id)
  end

  def create
    @order = Order.create(user_id: current_user.id)
    Address.create(address_params)

    redirect_to new_order_delivery_method_path(@order.id)
  end

  private

  def address_params
    # address_params = params.require(:order).permit(adresses:[:city,  :street ])
    # address_params.merge({ order_id: @order.id })
    { order_id: @order.id, street: 'test street', city: 'city'}
  end
end
