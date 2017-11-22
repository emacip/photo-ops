# spec/requests/photographers_spec.rb
require 'rails_helper'


RSpec.describe 'Photographers API', type: :request do
  # initialize test data
  let!(:photographer) { create(:photographer) }

  # Test suite for GET /photographers
  describe 'GET /photographers' do
    # make HTTP get request before each example
    before { get '/photographers' }

    context 'when photographers exists' do
      it 'returns photographers' do
        expect(json).not_to be_empty
        expect(json.size).to eq(1)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when photographers does not exists' do
      let(:photographer) { 0 }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns a empty Array' do
        expect([]).to be_empty
      end
    end
  end
end