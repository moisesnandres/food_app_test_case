require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe 'GET #index' do
    before do
      create(:category, name: 'Beef')
    end

    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'returns all categories in the correct format' do
      get :index
      json = JSON.parse(response.body)

      expect(json.size).to eq(1)
      expect(json.first['name']).to eq('Beef')
      expect(json.first.keys).to match_array(['id', 'name', 'description', 'image_url'])
    end
  end
end
