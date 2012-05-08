# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :technical_info do
    sharpen_time 1
    expected_quantity 1
    actual_quantity 1
    expected_length "9.99"
    actual_length "9.99"
    tool_material nil
  end
end
