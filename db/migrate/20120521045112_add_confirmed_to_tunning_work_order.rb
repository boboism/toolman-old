class AddConfirmedToTunningWorkOrder < ActiveRecord::Migration
  def change
    add_column :tunning_work_orders, :confirmed, :boolean
    add_index :tunning_work_orders, :confirmed
  end
end
