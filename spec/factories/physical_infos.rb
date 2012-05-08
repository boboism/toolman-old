# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :physical_info do
    first_diameter "9.99"
    step_length "9.99"
    second_diameter "9.99"
    slot_length "9.99"
    gross_length "9.99"
    hilt_length "9.99"
    tool_material nil
  end
end
