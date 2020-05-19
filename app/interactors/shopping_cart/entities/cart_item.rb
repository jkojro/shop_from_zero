class ShoppingCart
  module Entities
    class CartItem
      attr_reader :quantity, :product_id

      def initialize(product_id:product_id, quantity:0)
        @quantity = quantity.to_i
        @product_id = product_id
      end

      def update_quantity(value)
        self.quantity += value.to_i
      end

      def product
        Product.find(product_id)
      end

      def valid?
        quantity <= 5 && quantity >= 0
      end

      def serialize
        { product_id => quantity }
      end

      private

      attr_writer :quantity
    end
  end
end
