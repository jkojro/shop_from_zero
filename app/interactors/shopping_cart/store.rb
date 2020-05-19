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

    def update_items(items)
      content.merge!(items.map(&:serialize).inject(:merge))
    end

    def clear
      content.clear
    end
  end
end
