# frozen_string_literal: true

require 'rails_helper'

describe SearchProduct, type: :service do
  describe '#perform' do
    let!(:product) { create(:product, name: 'Product') }
    let!(:wierd_name) { create(:product, name: 'Wierd name') }
    let!(:fine_phrase) { create(:product, name: 'Fine Phrase') }

    it 'finds all products with name' do
      expect(SearchProduct.new.call('Product')).to eq [product]
    end

    it 'has case insensitive search' do
      expect(SearchProduct.new.call('NAME')).to eq [wierd_name]
    end

    it 'search sound alike' do
      expect(SearchProduct.new.call('fraz')).to eq [fine_phrase]
    end

    it 'search by trigrams' do
      expect(SearchProduct.new.call('phrse')).to eq [fine_phrase]
    end
  end
end
