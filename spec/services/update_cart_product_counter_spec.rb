# frozen_string_literal: true

require 'rails_helper'

describe UpdateCartProductCounter, type: :service do
  describe '#call' do
    let(:cart_product) { create(:cart_product, counter: 2) }
    let(:params) { { number_to_add: 3 } }

    subject { UpdateCartProductCounter.new(cart_product).call(params) }

    it "add number from params to subject's counter" do
      expect { subject }.to change { cart_product.counter }.from(2).to(5)
    end
  end
end
