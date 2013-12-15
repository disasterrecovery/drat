# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :recovery_resource_draft do
    name "MyString"
    national false
    state "MyString"
    locale "MyString"
    description "MyText"
    published false
    recovery_resource_id 1
  end
end
