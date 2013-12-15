# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :recovery_resource do
    name "Financial Resource"
    national false
    state "Colorado"
    locale "Jefferson County"
    description "Recovery Resource Description"
    published false
    recovery_resource_id 1
  end
end
