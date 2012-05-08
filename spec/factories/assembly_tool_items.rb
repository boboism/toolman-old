# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :assembly_tool_item do
    assembly_tool nil
    tool_material nil
    quantity "9.99"
    uom "MyString"
    standard_sharpen_time "9.99"
  end
end
