class AddOperationTypeToTunningWorkOrderItem < ActiveRecord::Migration
  def change
    add_column :tunning_work_order_items, :operation_type_id, :integer
    add_index :tunning_work_order_items, :operation_type_id
  end
end
