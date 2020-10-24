class OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    ahoy.track "My first event", language: "Ruby"
    @order = current_user.orders.build

    render 'new'
  end

  def create
    @checkout = build_checkout
    @checkout.update_order(order_params)
    @checkout.next_step
    @order = @checkout.order
    @deliverty_methods = DeliveryMethod.all

    render 'create'
  end

  def update
    @checkout = Checkout.new(order: order, user_id: current_user.id, step: params[:order][:step])
    @checkout.update_order(params[:order])
    @checkout.next_step
    @order = @checkout.order

    render 'create'
  end

  private

  def build_checkout
    Checkout.new(order: order, user_id: current_user.id, step: params[:step])
  end

  def order
    Order.find(params[:id]) if params[:id]
  end

  def order_params
    params[:order].merge({ shopping_cart: shopping_cart })
  end
end
