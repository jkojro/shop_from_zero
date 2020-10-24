# frozen_string_literal: true

class ShoppingCart
  attr_reader :store

  def initialize(session)
    @store = Store.new(session)
  end

  def add_item(product_id:, quantity:)
    AddItem.new(self).call(product_id: product_id, quantity: quantity)
  end

  def update_quantities(params)
    UpdateQuantities.new(store).call(params)
  end

  def clear
    store.clear
  end

  def find_item(product_id)
    items.find { |item| item.product_id == product_id }
  end

  def items
    store.content.map do |product_id, quantity|
      ShoppingCart::Entities::CartItem.new(product_id: product_id, quantity: quantity)
    end
  end

  def total_sum
    items.sum { |item| item.quantity * item.product.price }
  end
end
