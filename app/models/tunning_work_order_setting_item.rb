class TunningWorkOrderSettingItem < TunningWorkOrderItem
  belongs_to :tunning_work_order
  belongs_to :setting_type, :class_name => :SettingType, :foreign_key => :operation_type_id
  belongs_to :setting_device, :class_name => :SettingDevice, :foreign_key => :operation_device_id
  belongs_to :operator, :class_name => :User, :foreign_key => :operator_id
  attr_accessible :actual_time, :expected_time, :operation_device_id, :operation_type_id, :operator_id
end
