# frozen_string_literal: true

class AddCounterToCartProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :cart_products, :counter, :integer, default: 0
  end
end
