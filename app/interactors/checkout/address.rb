class Checkout
  class Address
    # include AttributedObject::Strict

    # attribute :city
    # attribute :street

    def self.form
      'checkout/address'
    end

    def self.update_order(order:, user_id:, params:)
      order = Order.create(user_id: user_id)
      ::Address.create(
        order_id: order.id,
        city: params[:city],
        street: params[:street]
      )
      order
    end
  end
end
