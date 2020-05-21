# frozen_string_literal: true

class ShoppingCart
  class UpdateQuantities
    include Dry::Monads[:result]
    ITEMS_KEY = :items

    def initialize(store)
      @store = store
    end

    def call(params)
      items = params[ITEMS_KEY].map do |product_id, quantity|
        ShoppingCart::Entities::CartItem.new(product_id: product_id, quantity: quantity)
      end

      if items.map(&:valid?).all? && items.count <= 10
        items.each { |item| store.add_item(item) }
        Success('Cart updated')
      else
        Failure('Invalid quantiti')
      end
    end

    private

    attr_reader :store
  end
end
