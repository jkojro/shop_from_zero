class ShoppingCart
  class AddItem

    def initialize(cart)
      @cart = cart
    end

    def call(product_id:, quantity:)
      cart_item = cart.find_item(product_id)
      cart_item ||= ShoppingCart::Entities::CartItem.new(product_id, quantity)
      cart_item.update_quantity(quantity)

      if cart_item.valid?
        cart.store[product_id] = cart_item.quantity
      else
        'Invalid quantity'
      end
    end

    private

    attr_reader :cart
  end
end
