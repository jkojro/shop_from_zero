class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :delivery_method_id, foreign_key: true
      t.integer :payment_method_id, foreign_key: true
      t.references :user, null: false, foreign_key: true
    end
  end
end
