# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :quality_deviation_report do
    doc_no "MyString"
    doc_date "2012-05-24"
    category_1_id 1
    category_2_id 1
    category_3_id 1
    category_4_id 1
    category_5_id 1
    category_6_id 1
    title "MyString"
    happen_start_time "2012-05-24 09:30:10"
    happen_start_team "MyString"
    happen_end_time "2012-05-24 09:30:10"
    happen_end_team "MyString"
    stocking_quantity 1
    bad_quantity 1
    doc_user_id 1
    doc_user_type "MyString"
    assembly_tool_id 1
    reason "MyText"
    reason_type "MyString"
    solution "MyText"
    suggestion "MyText"
  end
end
