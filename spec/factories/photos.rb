# spec/factories/photographers.rb
FactoryBot.define do
  factory :photo do
    url { Faker::Internet.url }
    code { Faker::Crypto.md5 }
    photographer_id nil
  end
end