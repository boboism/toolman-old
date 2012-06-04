class AddLogisticStatusToAssemblyTool < ActiveRecord::Migration
  def change
    add_column :assembly_tools, :stock_status, :string
    add_index :assembly_tools, :stock_status
  end
end
