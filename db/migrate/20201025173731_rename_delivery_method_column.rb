class RenameDeliveryMethodColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :delivery_methods, :dutarion, :duration
  end
end
