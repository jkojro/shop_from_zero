class ShoppingCart
  class UpdateQuantities
    ITEMS_KEY = :items

    def initialize(cart)
      @cart = cart
    end

    def call(params)
      params[ITEMS_KEY].each { |k, v| cart.store[k] = v.to_i }
    end

    private

    attr_reader :cart
  end
end
