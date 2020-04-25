# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe 'factory' do
    it 'has valid factory' do
      expect(build(:cart)).to be_valid
    end
  end
end
