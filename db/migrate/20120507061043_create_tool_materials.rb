class CreateToolMaterials < ActiveRecord::Migration
  def change
    create_table :tool_materials do |t|
      t.string :tool_no
      t.references :category
      t.references :sub_category
      t.string :model
      t.boolean :standardized
      t.integer :service_quantity
      t.boolean :sharpen_part

      t.timestamps
    end
    add_index :tool_materials, :tool_no
    add_index :tool_materials, :category_id
    add_index :tool_materials, :sub_category_id
    add_index :tool_materials, :model
  end
end
