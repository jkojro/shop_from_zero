require 'rails_helper'

describe ProductsSearcher, type: :service do
  describe '#perform' do
    let!(:product) { create(:product, name: 'Product') }
    let!(:wierd_name) { create(:product, name: 'Wierd name') }
    let!(:fine_phrase) { create(:product, name: 'Fine Phrase') }

    it 'finds all products with name including given phrase' do
      expect(ProductsSearcher.new('uc').perform).to eq [product]
    end

    it 'has case insensitive search' do
      expect(ProductsSearcher.new('NAME').perform).to eq [wierd_name]
    end
  end
end
