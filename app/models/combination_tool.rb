class CombinationTool < ActiveRecord::Base
  belongs_to :assembly_tool
  attr_accessible :stock_in_date, :stock_in_operator, :stock_out_date, :stock_out_operator, :stock_status
end
