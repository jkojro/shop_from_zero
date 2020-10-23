class Admin
  class OrdersController < BaseAdminController
    def index
      @orders = Order.all
    end
  end
end
