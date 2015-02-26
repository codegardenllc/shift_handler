# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :employee do
    name "MyString"
    email "MyString"
    organization nil
    admin false
  end
end
