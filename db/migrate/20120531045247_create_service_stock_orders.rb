class CreateServiceStockOrders < ActiveRecord::Migration
  def change
    create_table :service_stock_orders do |t|
      t.string :io
      t.integer :doc_user_id
      t.datetime :doc_date
      t.integer :operator_id
      t.datetime :operation_date
      t.integer :assembly_tool_id

      t.timestamps
    end
    add_index :service_stock_orders, :io
    add_index :service_stock_orders, :doc_user_id
    add_index :service_stock_orders, :operator_id
    add_index :service_stock_orders, :assembly_tool_id
  end
end
