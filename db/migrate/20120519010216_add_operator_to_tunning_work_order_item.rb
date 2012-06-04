class AddOperatorToTunningWorkOrderItem < ActiveRecord::Migration
  def change
    add_column :tunning_work_order_items, :operator_id, :integer
    add_index :tunning_work_order_items, :operator_id
  end
end
