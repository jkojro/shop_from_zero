class Product < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many :cart_products, dependent: :destroy
  has_many :carts, through: :cart_products

  validates_presence_of :name, :price

  def cart_products_count(cart_id)
    cart_products.where(cart_id: cart_id).first.counter
  end
end
