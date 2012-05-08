# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :assembly_tool do
    product_line nil
    facility_type nil
    facility_code nil
    workshop_process nil
    hilt_no "MyString"
    processing_position "MyString"
    processing_hole "MyString"
    tool_part_quantity 1
    rpm "9.99"
    first_velocity "9.99"
    max_diameter "9.99"
    max_velocity "9.99"
    feed_speed "9.99"
    blade_quantity "9.99"
    standard_setting_time "9.99"
  end
end
