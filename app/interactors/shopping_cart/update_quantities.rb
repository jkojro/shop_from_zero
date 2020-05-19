class ShoppingCart
  class UpdateQuantities
    include Dry::Monads[:result]
    ITEMS_KEY = :items

    def initialize(cart)
      @cart = cart
    end

    def call(params)
      items = params[ITEMS_KEY].map do |product_id, quantity|
        ShoppingCart::Entities::CartItem.new(product_id: product_id, quantity: quantity)
      end

      if items.map(&:valid?).all? && items.count <= 10
        cart.store.clear
        cart.store.merge!(items.map(&:serialize).inject(:merge!))
        Success(cart)
      else
        Failure('Invalid quantiti')
      end
    end

    private

    attr_reader :cart
  end
end
