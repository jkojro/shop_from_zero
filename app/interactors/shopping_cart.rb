class ShoppingCart

  CART_KEY = :cart

  attr_reader :store

  def initialize(session)
    session[CART_KEY] ||= {}
    @store = session[CART_KEY]
  end

  def add_item(product_id:, quantity:)
    ShoppingCart::AddItem.new(self).call(product_id: product_id, quantity: quantity)
  end

  def update_quantities(params)
    UpdateQuantities.new(self).call(params)
  end

  def clear
    store.clear
  end

  def find_item(product_id)
    items.find { |item| item.product_id == product_id }
  end

  def items
    @_items ||= begin
      store.map do |product_id, quantity|
        ShoppingCart::Entities::CartItem.new(product_id: product_id, quantity: quantity)
      end
    end
  end
end
