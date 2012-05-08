class StockingInfo < ActiveRecord::Base
  belongs_to :tool_material
  attr_accessible :current_quantity, :max_quantity, :min_quantity, :stack_no, :stock_no
end
