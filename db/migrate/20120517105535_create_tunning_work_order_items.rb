class CreateTunningWorkOrderItems < ActiveRecord::Migration
  def change
    create_table :tunning_work_order_items do |t|
      t.string :type
      t.references :tunning_work_order
      t.integer :operation_device_id
      # t.integer :assembly_tool_id
      t.integer :tool_part_id
      t.integer :expected_time
      t.integer :actual_time
      t.integer :expected_quantity
      t.integer :actual_quantity

      t.timestamps
    end
    add_index :tunning_work_order_items, :type
    add_index :tunning_work_order_items, :tunning_work_order_id
    add_index :tunning_work_order_items, :operation_device_id
    # add_index :tunning_work_order_items, :assembly_tool_id
    add_index :tunning_work_order_items, :tool_part_id
  end
end
