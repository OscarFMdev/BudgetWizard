require 'faker'

FactoryBot.define do
  factory :entity do
    name { Faker::Company.name }
    amount { Faker::Number.decimal(l_digits: 2) }

    association :group, factory: :group
    association :author, factory: :user
  end
end
