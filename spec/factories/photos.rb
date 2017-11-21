# spec/factories/photographers.rb
FactoryBot.define do
  factory :photo do
    photographer
    url   { Faker::Internet.url }
    code  { Faker::Crypto.md5 }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec','fixtures', 'assets','test_file.jpg'),
                                         'image/jpg')}
  end
end