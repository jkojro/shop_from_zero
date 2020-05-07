# frozen_string_literal: true

require 'rails_helper'

describe Validators::CartProductValidator, type: :service do
  describe '#call' do
    subject { Validators::CartProductValidator.new.call(params) }

    context 'valid params' do
      let(:params) { { number_to_add: 2, cart_id: 1, product_id: 1 } }

      it 'returns success' do
        expect(subject.success?).to be true
      end
    end

    context 'too many products to add' do
      let(:params) { { number_to_add: 6, cart_id: 1, product_id: 1 } }

      it 'returns error' do
        expect(subject.errors.to_h.values).to eq [['Dodałeś zbyt wiele sztuk produktu']]
      end
    end
  end
end
