# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tunning_work_order_item do
    type ""
    tunning_work_order nil
    operation_device_id 1
    assembly_tool_id 1
    tool_part_id 1
    expected_time 1
    actual_time 1
    expected_quantity 1
    actual_quantity 1
  end
end
