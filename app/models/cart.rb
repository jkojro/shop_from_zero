# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :cart_products, dependent: :destroy
  has_many :products, through: :cart_products

  accepts_nested_attributes_for :products
end
