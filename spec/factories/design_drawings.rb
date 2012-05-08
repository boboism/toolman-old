# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :design_drawing do
    name "MyString"
    file_suffix "MyString"
    size 1
    url "MyString"
    assembly_tool nil
  end
end
