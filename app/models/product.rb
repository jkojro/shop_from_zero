# frozen_string_literal: true

class Product < ApplicationRecord
  include PgSearch::Model

  has_many :cart_products, dependent: :destroy
  has_many :carts, through: :cart_products

  accepts_nested_attributes_for :cart_products

  validates_presence_of :name, :price

  pg_search_scope :search_by_name, against: :name, using: { dmetaphone: {}, trigram: {}, tsearch: { prefix: true, any_word: true }}

  def cart_products_count(cart_id)
    cart_products.where(cart_id: cart_id).first.counter
  end
end
