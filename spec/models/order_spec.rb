# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order) { build(:order) }

  describe 'state transitions' do
    context "when in state 'created'" do
      it { expect(subject).to have_state(:created).on(:state) }
      it { expect(order).to transition_from(:created).to(:addressed).on_event(:set_address).on(:state) }
      it { expect(order).to_not transition_from(:created).to(:delivery_set).on_event(:set_delivery).on(:state) }
      it { expect(order).to_not transition_from(:created).to(:payment_set).on_event(:set_payment).on(:state) }
      it { expect(order).to_not transition_from(:created).to(:paid).on_event(:pay).on(:state) }
    end

    context "when in state 'addressed'" do
      before do
        order.state = 'addressed'
      end
      it { expect(order).to have_state(:addressed).on(:state) }
      it { expect(order).to transition_from(:addressed).to(:delivery_set).on_event(:set_delivery).on(:state) }
      # it { expect(order).to_not transition_from(:addressed).to(:payment_set).on_event(:set_payment).on(:state) }
      # it { expect(order).to_not transition_from(:addressed).to(:paid).on_event(:pay).on(:state) }
    end

    context "when in state 'delivery_set'" do
      before do
        order.state = 'delivery_set'
      end
      it { expect(order).to have_state(:delivery_set).on(:state) }
      it { expect(order).to transition_from(:delivery_set).to(:payment_set).on_event(:set_payment).on(:state) }
      # it { expect(order).to_not transition_from(:delivery_set).to(:paid).on_event(:pay).on(:state) }
    end

    context "when in state 'payment_set'" do
      before do
        order.state = 'payment_set'
      end

      it { expect(order).to have_state(:payment_set).on(:state) }
      it { expect(order).to transition_from(:payment_set).to(:paid).on_event(:pay).on(:state) }
    end
  end
end
