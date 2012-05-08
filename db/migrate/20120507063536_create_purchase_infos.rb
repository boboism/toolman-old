class CreatePurchaseInfos < ActiveRecord::Migration
  def change
    create_table :purchase_infos do |t|
      t.string :purchase_no
      t.references :manufacturer
      t.references :agency
      t.decimal :unit_price
      t.decimal :quantity
      t.references :tool_material

      t.timestamps
    end
    add_index :purchase_infos, :purchase_no
    add_index :purchase_infos, :manufacturer_id
    add_index :purchase_infos, :agency_id
    add_index :purchase_infos, :tool_material_id
  end
end
