require 'rails_helper'

RSpec.describe 'Streams API', type: :request do
  let!(:streams) { create_list(:stream, 10)}
  let(:stream_id) { streams.first.id}

  describe 'GET /streams' do
    before { get '/streams' }
    it 'returns streams' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  context 'when the record does not exist' do
    let(:stream_id) { 100 }

    it 'returns status code 404' do
      expect(response).to have_http_status(404)
    end

    it 'returns a not found message' do
      expect(response.body).to match(/Couldn't find stream/)
    end
  end

# Test suite for POST /streams
describe 'POST /streams' do
    # valid payload
  let(:valid_attributes) { { title: 'Learn Elm', created_by: '1' } }

  context 'when the request is valid' do
    before { post '/streams', params: valid_attributes }

    it 'creates a stream' do
      expect(json['title']).to eq('Learn Elm')
    end

    it 'returns status code 201' do
      expect(response).to have_http_status(201)
    end
  end

  context 'when the request is invalid' do
    before { post '/streams', params: { title: 'Foobar' } }

    it 'returns status code 422' do
      expect(response).to have_http_status(422)
    end

    it 'returns a validation failure message' do
      expect(response.body)
        .to match(/Validation failed: Created by can't be blank/)
    end
  end
end

# Test suite for PUT /streams/:id
describe 'PUT /streams/:id' do
  let(:valid_attributes) { { title: 'Shopping' } }

  context 'when the record exists' do
    before { put "/streams/#{stream_id}", params: valid_attributes }

    it 'updates the record' do
      expect(response.body).to be_empty
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end

# Test suite for DELETE /streams/:id
  describe 'DELETE /streams/:id' do
    before { delete "/streams/#{stream_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
