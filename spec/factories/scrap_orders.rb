# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :scrap_order do
    assembly_tool nil
    doc_user_id 1
    doc_date "2012-05-22"
    confirmed false
    scrap_type nil
    scrap_reason "MyText"
  end
end
