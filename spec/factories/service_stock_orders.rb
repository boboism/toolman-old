# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :service_stock_order do
    io "MyString"
    doc_user_id 1
    doc_date "2012-05-31 12:52:47"
    operator_id 1
    assembly_tool nil
  end
end
