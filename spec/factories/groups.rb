require 'faker'

FactoryBot.define do
  factory :group do
    name { Faker::Company.name }

    association :author, factory: :user
  end
end
