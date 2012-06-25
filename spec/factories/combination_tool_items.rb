# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :combination_tool_item do
    combination_tool nil
    tool_part nil
    stock_status "MyString"
  end
end
