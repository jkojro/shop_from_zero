# frozen_string_literal: true

require 'rails_helper'

describe '/cart_products', type: :request do
  let(:cart) { create(:cart) }

  describe '#create' do
    subject { post '/cart_products', params: { cart_product: { product_id: 1, cart_id: cart.id } } }

    it 'creates cart_product and redirects to cart' do
      subject
      expect(response.status).to eq(302)
    end
  end

  describe '#update' do
    let(:cart_product) { create(:cart_product) }
    subject { patch "/cart_products/#{cart_product.id}", params: { cart_product: { number_to_add: 2 } } }

    it 'updates cart_product and redirects to cart' do
      subject
      expect(response.status).to eq(302)
    end
  end
end
