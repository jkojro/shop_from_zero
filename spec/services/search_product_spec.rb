# frozen_string_literal: true

require 'rails_helper'

describe SearchProduct, type: :service do
  describe '#perform' do
    let!(:product) { create(:product, name: 'Product') }
    let!(:wierd_name) { create(:product, name: 'Wierd name') }
    let!(:fine_phrase) { create(:product, name: 'Fine Phrase') }

    it 'finds all products with name including given phrase' do
      expect(SearchProduct.new.call('uc')).to eq [product]
    end

    it 'has case insensitive search' do
      expect(SearchProduct.new.call('NAME')).to eq [wierd_name]
    end
  end
end
