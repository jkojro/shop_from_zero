module Admin
  class OrdersController < BaseAdminController
    def index
      @q = Order.ransack(params[:q])
      @orders = @q.result.includes(:user, :delivery_method)
    end
  end
end
