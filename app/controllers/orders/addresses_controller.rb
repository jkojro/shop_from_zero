# frozen_string_literal: true

class Orders::AddressesController < ApplicationController

  def new
    @address = Addreess.new
  end

  def create
    order = Order.create
    @address = Address.new(address_params)
    @address.order_id = order.id
    @address.save

    redirect_to: delivery_method_path(order)
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
  end
end
