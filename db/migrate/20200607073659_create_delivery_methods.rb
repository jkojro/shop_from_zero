class CreateDeliveryMethods < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_methods do |t|
      t.string :name
      t.integer :price
      t.integer :dutarion
    end
  end
end
