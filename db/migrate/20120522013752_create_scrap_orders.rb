class CreateScrapOrders < ActiveRecord::Migration
  def change
    create_table :scrap_orders do |t|
      t.references :assembly_tool
      t.integer :doc_user_id
      t.date :doc_date
      t.boolean :confirmed
      t.references :scrap_type
      t.text :scrap_reason

      t.timestamps
    end
    add_index :scrap_orders, :assembly_tool_id
    add_index :scrap_orders, :doc_user_id
    add_index :scrap_orders, :confirmed
    add_index :scrap_orders, :scrap_type_id
  end
end
