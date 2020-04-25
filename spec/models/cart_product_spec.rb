# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CartProduct, type: :model do
  describe 'factory' do
    it 'has valid factory' do
      expect(build(:cart_product)).to be_valid
    end
  end

  describe 'validations' do
    it 'is invalid without product' do
      cart_product = build(:cart_product, product: nil)
      cart_product.valid?
      expect(cart_product.errors[:product]).to include 'must exist'
    end

    it 'is invalid without cart' do
      cart_product = build(:cart_product, cart: nil)
      cart_product.valid?
      expect(cart_product.errors[:cart]).to include 'must exist'
    end
  end
end
