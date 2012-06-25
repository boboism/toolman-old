class CombinationToolItem < ActiveRecord::Base
  belongs_to :combination_tool
  belongs_to :tool_part
  attr_accessible :stock_status
end
