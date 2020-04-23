# frozen_string_literal: true

require 'rails_helper'

describe ProductsController, type: :request do
  describe '#index' do
    context 'responds with success' do
      it 'renders the :new view' do
        get '/products'
        expect(response.status).to eq(200)
        expect(response).to render_template :index
      end
    end
  end

  describe '#show' do
    let(:product) { create(:product) }

    it 'responds with success' do
      get "/products/#{product.id}"
      expect(response.status).to eq(200)
      expect(response).to render_template :show
    end
  end

  describe '#search' do
    let!(:product) { create(:product, name: 'Best product') }
    let!(:other_product) { create(:product, name: 'Other product') }

    it 'redirects to search page' do
      get '/products/search', params: { q: 'best' }
      expect(response.status).to eq(200)
      expect(response).to render_template :search
      expect(assigns(:products)).to eq [product]
    end
  end
end
