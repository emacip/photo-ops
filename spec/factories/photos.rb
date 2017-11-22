# spec/factories/photos.rb
FactoryBot.define do
  factory :photo do
    url   { Faker::Internet.url }
    code  { 'uur0cj2h'}
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec','fixtures', 'assets','test_file.jpg'),
                                         'image/jpg')}
    revoke false
    photographer_id nil
  end
end