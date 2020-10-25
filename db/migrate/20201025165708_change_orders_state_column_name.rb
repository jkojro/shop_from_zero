class ChangeOrdersStateColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :orders, :aasm_state, :state
  end
end
