# frozen_string_literal: true

require 'rails_helper'

describe SearchProduct, type: :service do
  describe '#call' do
    let!(:product) { create(:product, name: 'Product') }
    let!(:wierd_name) { create(:product, name: 'Wierd name') }
    let!(:fine_phrase) { create(:product, name: 'Fine Phrase') }
    let(:search_phrase) { 'Product'}

    subject { SearchProduct.new.call(search_phrase) }

    it 'finds all products with name' do
      expect(subject).to eq [product]
    end

    context 'case insensitive search' do
      let(:search_phrase) { 'NAME'}

      it 'has case insensitive search' do
        expect(subject).to eq [wierd_name]
      end
    end

    context 'search sound alike' do
      let(:search_phrase) { 'fraz' }

      it 'search sound alike' do
        expect(subject).to eq [fine_phrase]
      end
    end

    context 'search by trigrams' do
      let(:search_phrase) { 'phrse' }

      it 'search by trigrams' do
        expect(subject).to eq [fine_phrase]
      end
    end
  end
end
