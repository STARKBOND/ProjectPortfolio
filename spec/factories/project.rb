require 'faker'

# This will guess the Project class
FactoryBot.define do
    factory :project do
      title { Faker::Hacker.adjective + Faker::Hacker.noun  }
      description { Faker::Hacker.say_something_smart }
    end
  end
