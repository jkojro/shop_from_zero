# frozen_string_literal: true

class AddUserIdToCart < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :user_id, :integer
    add_index :carts, :user_id
  end
end
