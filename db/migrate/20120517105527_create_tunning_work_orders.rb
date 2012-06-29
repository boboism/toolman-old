class CreateTunningWorkOrders < ActiveRecord::Migration
  def change
    create_table :tunning_work_orders do |t|
      t.integer :doc_user_id
      t.boolean :is_confirm
      t.integer :assembly_tool_id

      t.timestamps
    end
    add_index :tunning_work_orders, :doc_user_id
    add_index :tunning_work_orders, :is_confirm
    add_index :tunning_work_orders, :assembly_tool_id
  end
end
