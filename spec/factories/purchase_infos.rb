# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :purchase_info do
    purchase_no "MyString"
    manufacturer nil
    agency nil
    unit_price "9.99"
    quantity "9.99"
    tool_material nil
  end
end
