class Checkout
  class DeliveryMethod

    def self.form
      'checkout/delivery_method'
    end

    def self.update_order(order:, user_id:, params:)
      order.update(delivery_method_id: params[:delivery_method_id])
      order
    end
  end
end
