# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :archive_file do
    type ""
    name "MyString"
    file_suffix "MyString"
    size 1
    url "MyString"
  end
end
