# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShoppingCart do
  let(:session) { {} }
  subject { described_class.new(session) }

  describe '#initialize' do
    it 'initialize store with session' do
      expect(ShoppingCart::Store).to receive(:new).with(session)
      subject
    end
  end

  describe '#add_item' do
    let(:product) { create(:product) }
    it 'calls ShoppingCart::AddItem service with parameters' do
      expect_any_instance_of(ShoppingCart::AddItem).to receive(:call).with(product_id: product.id, quantity: 2)
      subject.add_item(product_id: product.id, quantity: 2)
    end
  end

  describe '#update_quantities' do
    let(:params) { { '1' => 3 } }
    let(:update_service) { instance_double(ShoppingCart::UpdateQuantities) }

    before { allow(ShoppingCart::UpdateQuantities).to receive(:new).and_return(update_service) }

    it 'calls ShoppingCart::AddItem service with parameters' do
      expect(update_service).to receive(:call).with(params)
      subject.update_quantities(params)
    end
  end

  describe '#items' do
    let(:params) { { '1' => 3, '2' => 1 } }
    before { allow(subject.store).to receive(:content).and_return(params) }

    it 'deserialize cart items' do
      expect(ShoppingCart::Entities::CartItem).to receive(:new).with(product_id: '1', quantity: 3)
      expect(ShoppingCart::Entities::CartItem).to receive(:new).with(product_id: '2', quantity: 1)
      subject.items
    end
  end

  describe '#clear' do
    let(:store) { instance_double(ShoppingCart::Store) }
    before { allow(subject).to receive(:store).and_return(store) }

    it 'clears store' do
      expect(store).to receive(:clear)
      subject.clear
    end
  end
end
