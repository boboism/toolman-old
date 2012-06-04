class TunningWorkOrderSharpenItem < TunningWorkOrderItem
  belongs_to :tunning_work_order
  belongs_to :tool_part, :class_name => :ToolPart, :foreign_key => :tool_part_id, :autosave => true, :conditions => {:in_service => true}
  belongs_to :sharpen_device, :class_name => :SharpenDevice, :foreign_key => :operation_device_id
  belongs_to :operator, :class_name => :User, :foreign_key => :operator_id
  attr_accessible :actual_quantity, :actual_time, :expected_quantity, :expected_time, :operation_device_id, :tool_part_id, :operator_id
end
