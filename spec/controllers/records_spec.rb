require 'rails_helper'

RSpec.describe RecordsController, type: :controller do
  describe 'POST create' do
    it 'returns status 201' do
      post :create, params: { title: 'test', artist: 'test', year: 2022, genre: 'test', image_data: 'null' }
      expect(response.status).to eq(201)
    end

    it 'returns status 500' do
      post :create, params: { title: nil, artist: 'test', year: 2022, genre: 'test', image_data: 'null' }
      expect(response.status).to eq(500)
    end
  end

  describe 'GET index' do
    it 'returns records array' do
      get :index
      expect(response.status).to eq(200)
      parsed_response = JSON.parse(response.body)
      expect(parsed_response).not_to be_empty
    end
  end
end
