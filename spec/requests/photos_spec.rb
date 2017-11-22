# spec/requests/photos_spec.rb
require 'rails_helper'
require 'rack/test'


RSpec.describe 'Photos API', type: :request do
  # initialize test data
  let!(:photographer) { create(:photographer) }
  let(:photographer_id) { photographer.id }


  # Test suite for PUT /photographers/:photographer_id/photos
  describe 'POST /photographers/:photographer_id/photos' do

    context 'Upload one photo' do
      let(:valid_attributes) { {url: 'http://thiel.com/chauncey_simonis',
                                          image: Rack::Test::UploadedFile.new(Rails.root.join('spec','fixtures', 'assets','test_file.jpg'),
                                                                              'image/jpg') }  }

      before { post "/photographers/#{photographer_id}/photos", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

      it 'returns photo code' do
        expect(json.size).to eq(1)
      end
    end

  end



end