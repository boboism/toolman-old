class AddOperationDateToServiceStockOrder < ActiveRecord::Migration
  def change
    add_column :service_stock_orders, :operation_date, :datetime
  end
end
