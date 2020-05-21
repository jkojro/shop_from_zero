# frozen_string_literal: true

class ShoppingCart
  class Store
    CART_KEY = :cart

    attr_reader :content

    def initialize(session)
      session[CART_KEY] ||= {}
      @content = session[CART_KEY]
    end

    def add_item(cart_item)
      content[cart_item.product_id] = cart_item.quantity
    end

    def clear
      content.clear
    end
  end
end
