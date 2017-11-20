# spec/requests/photographers_spec.rb
require 'rails_helper'


RSpec.describe 'Photographers API', type: :request do
  # initialize test data
  let!(:photographer) { create(:photographer) }
  let!(:photos) { create_list(:photo, 20, photographer_id: photographer.id) }
  let(:photographer_id) { photographer.id }

  # Test suite for GET /photographers
  describe 'GET /photographers' do
    # make HTTP get request before each example
    before { get '/photographers' }

    it 'returns photographers' do
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

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

end