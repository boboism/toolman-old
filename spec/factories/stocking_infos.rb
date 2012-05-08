# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :stocking_info do
    stock_no "MyString"
    stack_no "MyString"
    current_quantity "9.99"
    max_quantity "9.99"
    min_quantity "9.99"
    tool_material nil
  end
end
