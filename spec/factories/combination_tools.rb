# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :combination_tool do
    assembly_tool nil
    stock_status "MyString"
    stock_out_operator 1
    stock_out_date "2012-06-25 18:33:52"
    stock_in_operator 1
    stock_in_date "2012-06-25 18:33:52"
  end
end
