# frozen_string_literal: true

class ShoppingCart
  class AddItem
    include Dry::Monads[:result]

    def initialize(cart)
      @cart = cart
    end

    def call(product_id:, quantity:)
      cart_item = cart.find_item(product_id)
      cart_item ||= ShoppingCart::Entities::CartItem.new(product_id: product_id)
      cart_item.update_quantity(quantity)

      if cart_item.valid?
        cart.store.add_item(cart_item)
        Success(cart)
      else
        Failure('Invalid quantity')
      end
    end

    private

    attr_reader :cart
  end
end
