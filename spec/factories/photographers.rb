# spec/factories/photographers.rb
FactoryBot.define do
  factory :photographer do
    name { Faker::HarryPotter.character }
  end
end