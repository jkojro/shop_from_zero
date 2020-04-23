# frozen_string_literal: true

require 'rails_helper'

describe ProductsController, type: :request do
  describe '#index' do
    context 'responds with success' do
      subject { get '/products' }

      it 'renders the :new view' do
        subject
        expect(response.status).to eq(200)
      end
    end
  end

  describe '#show' do
    let(:product) { create(:product) }
    subject { get "/products/#{product.id}" }

    it 'responds with success' do
      subject
      expect(response.status).to eq(200)
    end
  end

  describe '#search' do
    let!(:product) { create(:product, name: 'Best product') }
    let!(:other_product) { create(:product, name: 'Other product') }
    subject { get '/products/search', params: { q: 'best' }}

    it 'redirects to search page' do
      subject
      expect(response.status).to eq(200)
    end
  end
end
