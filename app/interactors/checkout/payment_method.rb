class Checkout
  class PaymentMethod

    def self.form
      'checkout/payment_method'
    end

    def self.update_order(order:, user_id:, params:)
      order.update(payment_method_id: params[:payment_method_id])
      order
    end
  end
end
