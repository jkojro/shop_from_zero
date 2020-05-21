# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShoppingCart::AddItem do

  let(:cart) { ShoppingCart.new(session) }
  subject { described_class.new(cart) }

  describe '#call' do
    context 'there is no items of this product in cart' do
      let(:session) { {} }

      it 'adds item to cart with given quantity' do
        subject.call(product_id: 1, quantity: 2)
        expect(cart.items.first.serialize).to eq({ 1 => 2 })
      end
    end

    context 'there is already item of this product in cart' do
      let(:session) { { cart: { 1 => 2 } } }

      it 'add quantitie to existing item' do
        subject.call(product_id: 1, quantity: 3)
        expect(cart.items.first.serialize).to eq({ 1 => 5 })
      end
    end

    context 'invalid number of items' do
      let(:session) { { cart: { 1 => 2 } } }

      it 'does not add items' do
        subject.call(product_id: 1, quantity: 4)
        expect{subject.call(product_id: 1, quantity: 4)}.to_not change{ cart.store }
      end

      it 'returns failure message' do
        expect(subject.call(product_id: 1, quantity: 4).failure).to eq 'Invalid quantity'
      end
    end
  end
end
