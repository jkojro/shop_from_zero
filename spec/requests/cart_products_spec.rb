# frozen_string_literal: true

require 'rails_helper'

describe '/cart_products', type: :request do
  describe '#create' do
    subject { post '/cart_products', params: { cart_product: { product_id: 1, number_to_add: 2 } } }

    it 'creates cart_product and redirects to cart' do
      subject
      expect(response.status).to eq(302)
    end
  end
end
