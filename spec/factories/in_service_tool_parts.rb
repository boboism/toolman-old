# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :in_service_tool_part do
    type ""
    part_no "MyString"
    category nil
    sub_category nil
    model "MyString"
    expected_sharpen_time 1
    actual_sharpen_time 1
    expected_quantity 1
    actual_quantity 1
    effective_date "2012-05-08"
    expired_date "2012-05-08"
    tool_material nil
  end
end
