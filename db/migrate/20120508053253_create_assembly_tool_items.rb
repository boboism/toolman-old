class CreateAssemblyToolItems < ActiveRecord::Migration
  def change
    create_table :assembly_tool_items do |t|
      t.references :assembly_tool
      t.references :tool_material
      t.decimal :quantity
      t.string :uom
      t.decimal :standard_sharpen_time

      t.timestamps
    end
    add_index :assembly_tool_items, :assembly_tool_id
    add_index :assembly_tool_items, :tool_material_id
  end
end
