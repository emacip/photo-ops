# spec/factories/photos.rb
FactoryBot.define do
  factory :photo do
    url   { Faker::Internet.url }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec','fixtures', 'assets','test_file.jpg'),
                                         'image/jpg')}
    photographer_id nil
  end
end