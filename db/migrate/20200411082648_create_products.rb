class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.decimal :price, :precision => 8, :scale => 2
      t.string :name, null: false
      t.text :description

      t.timestamps
    end
  end
end
