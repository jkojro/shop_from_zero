class Checkout
  class Address

    def self.form
      'checkout/address'
    end

    def self.update_order(order:, user_id:, params:)
      order = Order.create(user_id: user_id, total_sum: params[:shopping_cart].total_sum)
      ::Address.create(
        order_id: order.id,
        city: params[:city],
        street: params[:street]
      )
      order
    end
  end
end
