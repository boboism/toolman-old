class AddConfirmedToAssemblyTool < ActiveRecord::Migration
  def change
    add_column :assembly_tools, :confirmed, :boolean
    add_index :assembly_tools, :confirmed
  end
end
