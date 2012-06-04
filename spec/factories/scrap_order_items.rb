# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :scrap_order_item do
    scrap_order nil
    scrap_tool_part_id 1
    replace_tool_part_id 1
  end
end
