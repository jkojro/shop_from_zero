# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShoppingCart::UpdateQuantities do

  let(:store) { ShoppingCart::Store.new({}) }
  subject { described_class.new(store) }

  describe '#call' do
    context 'valid quantities' do
      let(:params) { { items: { 1 => 5 } } }
      it 'adds item to cart with given quantity' do
        subject.call(params)
        expect(store.content).to eq({ 1 => 5 })
      end
    end

    context 'invlid number of products' do
      let(:params) { { items: { 1 => 2, 2 => 2, 3 => 2, 4 => 2, 5 => 2,
        6 => 2, 7 => 2, 8 => 2, 9 => 2, 10 => 2, 11 => 2, } } }

      it 'add quantitie to existing item' do
        subject.call(params)
        expect(store.content).to eq({})
      end
    end

    context 'invalid item quantity' do
      let(:params) { { items: { 1 => 6 } } }

      it 'add quantitie to existing item' do
        subject.call(params)
        expect(store.content).to eq({})
      end
    end
  end
end
