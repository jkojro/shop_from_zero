# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Search', type: :system do
  before { driven_by(:rack_test) }

  describe 'search for products by name' do
    let!(:product) { create(:product, name: 'Product') }
    let!(:wierd_name) { create(:product, name: 'Wierd name duct') }
    let!(:fine_phrase) { create(:product, name: 'Fine Phrase') }

    # TODO: nie działa
    it 'does nothing when search form is emty' do
      visit '/products'
      find('button.search_loop').click
      expect(page.current_path).to eq '/products'
      message = page.find('#q', visible: :all).native.attribute('validationMessage')
      expect(message).to eq 'Wypełnij to pole.'
    end

    it 'finds proper products by name' do
      visit '/products'
      fill_in 'q', with: 'uc'
      find('button.search_loop').click
      expect(page.current_path).to eq '/search'
      expect(page).to have_text('Product')
      expect(page).to have_text('Wierd name duct')
    end

    it 'puts flash notice if no products found' do
      visit '/products'
      fill_in 'q', with: 'other'
      find('button.search_loop').click
      expect(page.current_path).to eq '/products'
      expect(page).to have_text('Nie ma takiego produktu')
    end
  end
end
