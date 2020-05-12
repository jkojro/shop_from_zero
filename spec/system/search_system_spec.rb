# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Search', type: :system do
  describe 'search for products by name' do
    before { driven_by(:selenium_chrome_headless) }

    let!(:product) { create(:product, name: 'Product') }
    let!(:wierd_name) { create(:product, name: 'Wierd name product') }
    let!(:fine_phrase) { create(:product, name: 'Fine Phrase') }

    scenario 'does nothing when search form is emty' do
      visit '/products'
      find('button.search_loop').click
      expect(page.current_path).to eq '/products'
      message = page.find('#q', visible: :all).native.attribute('validationMessage')
      expect(message).to eq 'Please fill out this field.'
    end

    scenario 'finds proper products by name' do
      visit '/products'
      fill_in 'q', with: 'Produc'
      find('button.search_loop').click
      expect(page.current_path).to eq '/products/search'
      expect(page).to have_text('Product')
      expect(page).to have_text('Wierd name product')
    end

    scenario 'puts flash notice if no products found' do
      visit '/products'
      fill_in 'q', with: 'other'
      find('button.search_loop').click
      expect(page.current_path).to eq '/products'
      expect(page).to have_text('Nie ma takiego produktu')
    end
  end
end
