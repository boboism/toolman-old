class CombinationTool < ActiveRecord::Base
  belongs_to :assembly_tool
  belongs_to :stock_in_operator, :class_name => :User
  belongs_to :stock_out_operator, :class_name => :User
  attr_accessible :stock_in_date, :stock_in_operator_id, :stock_out_date, :stock_out_operator_id, :stock_status, :assembly_tool_id
end
