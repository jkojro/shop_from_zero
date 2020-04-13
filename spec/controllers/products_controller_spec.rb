require 'rails_helper'

describe ProductsController, type: :controller do
  describe '#index' do
    let(:action) { get :index }
    
    context 'responds with success' do
      it 'renders the :new view' do
        action
        expect(response.status).to eq(200)
        expect(response).to render_template :index
      end
    end
  end

  describe '#show' do
    let(:product) { create(:product) }
    let(:action) { get :show, params: { id: product.id }}

    it 'responds with success' do
      action
      expect(response.status).to eq(200)
      expect(response).to render_template :show
    end
  end

  describe '#search' do
    let!(:product) { create(:product, name: 'Best product') }
    let!(:other_product) { create(:product, name: 'Other product') }
    let(:action) { get :search, params: { q: 'best' }}

    it 'redirects to search page' do
      action
      expect(response.status).to eq(200)
      expect(response).to render_template :search
      expect(assigns(:products)).to eq [product]
    end
  end
end
