class Product < ApplicationRecord

  has_many :cart_products
  has_many :carts, through: :cart_products

  validates_presence_of :name, :price

  def cart_products_count(cart_id)
    cart_products.where(cart_id: cart_id).count
  end
end
