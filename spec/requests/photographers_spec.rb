# spec/requests/photographers_spec.rb
require 'rails_helper'


RSpec.describe 'Photographers API', type: :request do
  # initialize test data
  let!(:photographers) { create_list(:photographer, 10) }
  let(:photographer_id) { photographers.first.id }
  let(:photos) { photographers.photos }

  # Test suite for GET /photographers
  describe 'GET /photographers' do
    # make HTTP get request before each example
    before { get '/photographers' }

    it 'returns photographers' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /photographers/:id
  describe 'GET /photographers/:id' do
    # make HTTP get request before each example
    before { get "/photographers/#{photographer_id}" }

    context 'when the record exists' do
      it 'returns the photographer' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(photographer_id)
        expect(json['photos']).to eq(photos)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

end