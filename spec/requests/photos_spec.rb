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

  # Test suite for GET /photos/:code
  describe 'GET /photographers/:photographer_id/photos/:code' do
    let!(:photographer) { create(:photographer) }
    let!(:photo) { create(:photo,  photographer_id: photographer.id) }
    let(:code) { photo.code }

    # make HTTP get request before each example
    before { get "/photographers/#{photographer_id}/photos/#{code}" }

    context 'Photographs match with the code' do
      it 'returns image' do
        expect(json.size).to eq(1)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  # Test suite for PUT /photographers/:photographer_id/photos/:code/revoke
  describe 'PUT /photographers/:photographer_id/photos/:code/revoke' do
    let!(:photographer) { create(:photographer) }
    let!(:photo) { create(:photo,  photographer_id: photographer.id) }
    let(:code) { photo.code }

    context 'Organiser revoke an access code' do
      let(:valid_attributes) { { revoke: true } }

      # make HTTP get request before each example
      before { put "/photographers/#{photographer_id}/photos/#{code}/revoke" , params: valid_attributes}


      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end

  end


end