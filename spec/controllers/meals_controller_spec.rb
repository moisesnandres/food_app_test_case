require 'rails_helper'

RSpec.describe MealsController, type: :controller do
  describe 'GET #index' do
    let!(:category) { create(:category, name: 'Beef') }
    let!(:meal1) { create(:meal, name: 'Beef A', category: category) }
    let!(:meal2) { create(:meal, name: 'Beef B', category: category) }

    context 'when the category exists' do
      it 'returns a successful response' do
        get :index, params: { category: 'Beef' }
        expect(response).to have_http_status(:success)
      end

      it 'returns all meals in the category' do
        get :index, params: { category: 'Beef' }
        json = JSON.parse(response.body)

        expect(json.size).to eq(2)
        expect(json.first['name']).to eq(meal1.name)
        expect(json.second['name']).to eq(meal2.name)
      end
    end

    context 'when the category does not exist' do
      it 'returns a not_found status' do
        get :index, params: { category: 'NonExistentCategory' }
        expect(response).to have_http_status(:not_found)
      end

      it 'returns an error message' do
        get :index, params: { category: 'NonExistentCategory' }
        json = JSON.parse(response.body)

        expect(json['error']).to eq('Category not found')
      end
    end
  end
end
