class AddAssemblyToolToTunningWorkOrder < ActiveRecord::Migration
  def change
    add_column :tunning_work_orders, :assembly_tool_id, :integer
    add_index :tunning_work_orders, :assembly_tool_id
  end
end
