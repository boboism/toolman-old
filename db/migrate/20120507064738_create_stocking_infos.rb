class CreateStockingInfos < ActiveRecord::Migration
  def change
    create_table :stocking_infos do |t|
      t.string :stock_no
      t.string :stack_no
      t.decimal :current_quantity
      t.decimal :max_quantity
      t.decimal :min_quantity
      t.references :tool_material

      t.timestamps
    end
    add_index :stocking_infos, :stock_no
    add_index :stocking_infos, :stack_no
    add_index :stocking_infos, :tool_material_id
  end
end
