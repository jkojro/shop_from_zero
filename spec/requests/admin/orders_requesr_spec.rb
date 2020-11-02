# frozen_string_literal: true

require 'rails_helper'

describe '/admin', type: :request do
  let(:admin) { create(:admin_user) }
  let(:order) { create(:order) }

  before do
    sign_in(admin)
  end

  describe '/orders' do
    subject { get '/admin/orders' }

    context 'when admin is signed in' do
      it 'renders orders' do
        subject
        expect(response.body).to include('orders')
      end
    end
  end
end
