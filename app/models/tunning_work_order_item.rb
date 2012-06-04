class TunningWorkOrderItem < ActiveRecord::Base
  belongs_to :tunning_work_order
  attr_accessible :actual_quantity, :actual_time, :expected_quantity, :expected_time, :operation_device_id, :tool_part_id, :type, :operation_type_id, :operator_id
end
