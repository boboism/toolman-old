class CreateTunningWorkOrders < ActiveRecord::Migration
  def change
    create_table :tunning_work_orders do |t|
      t.date :doc_date
      t.integer :doc_user_id

      t.timestamps
    end
    add_index :tunning_work_orders, :doc_user_id
  end
end
