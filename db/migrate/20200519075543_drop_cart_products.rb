# frozen_string_literal: true

class DropCartProducts < ActiveRecord::Migration[6.0]
  def change
    drop_table :cart_products
  end
end
