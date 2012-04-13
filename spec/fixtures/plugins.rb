# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :plugin do
    title "MyString"
    description "MyString"
    user { FactoryGirl.create(:user) }
  end
end
