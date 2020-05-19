# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validations' do
    it 'has valid factory' do
      expect(build(:product)).to be_valid
    end

    it 'is valid with name and price' do
      expect(build(:product, name: 'Product name', price: 1.00)).to be_valid
    end

    it 'is invalid without name' do
      product = build(:product, name: nil)
      product.valid?
      expect(product.errors[:name]).to include "can't be blank"
    end

    it 'is invalid without price' do
      product = build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include "can't be blank"
    end
  end
end
