# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Root page', type: :system do
  describe 'goes from main page to clicked product' do
    before { driven_by(:selenium_chrome_headless) }

    let!(:pierwszy) { create(:product, name: 'Pierwszy') }
    let!(:drugi) { create(:product, name: 'Drugi') }
    let!(:trzeci) { create(:product, name: 'Trzeci') }

    it 'displays product name' do
      visit '/products'
      expect(page).to have_text('Pierwszy')
      expect(page).to have_text('Drugi')
      expect(page).to have_text('Trzeci')
      expect(page).to have_text('3.33 zł')
      click_link 'Trzeci'
      expect(page.current_path).to eq "/products/#{trzeci.id}"
      expect(page).to have_text('Product description')
    end
  end
end
