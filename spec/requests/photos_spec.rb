# spec/requests/photos_spec.rb
require 'rails_helper'


RSpec.describe 'Photos API', type: :request do
  # initialize test data
  let!(:photographer) { create(:photographer) }
  let!(:photos) { create_list(:photo, 20, photographer_id: photographer.id) }
  let(:photographer_id) { photographer.id }

  # Test suite for GET /photographers/:photographer_id/photos
  describe 'GET /photographers/:photographer_id/photos' do
    # make HTTP get request before each example
    before { get "/photographers/#{photographer_id}/photos" }

    context 'when photographer exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all photographer photos' do
        expect(json.size).to eq(20)
      end
    end

    context 'when photographer does not exist' do
      let(:photographer_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Photographer/)
      end
    end
  end


  # Test suite for PUT /photographers/:photographer_id/photos
  describe 'POST /photographers/:photographer_id/photos' do
    let(:valid_attributes) { { url: 'http://thiel.com/chauncey_simonis', code: '6b5ed240042e8a65c55ddb826c3408e6' } }

    context 'when request attributes are valid' do
      before { post "/photographers/#{photographer_id}/photos", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end


  end



end