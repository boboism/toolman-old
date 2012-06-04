class AddAssembledToAssemblyTool < ActiveRecord::Migration
  def change
    add_column :assembly_tools, :assembled, :boolean
    add_index :assembly_tools, :assembled
  end
end
