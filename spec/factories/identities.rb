# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :identity do
    name "MyString"
    email "MyString"
    password_digest "MyString"
  end
end
