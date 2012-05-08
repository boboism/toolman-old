# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tool_material do
    tool_no "MyString"
    category nil
    sub_category nil
    model "MyString"
    standardized false
    service_quantity 1
    sharpen_part false
  end
end
