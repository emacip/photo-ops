# spec/factories/photographers.rb
FactoryBot.define do
  factory :photo do
    name { Faker::HarryPotter.character }
  end
end