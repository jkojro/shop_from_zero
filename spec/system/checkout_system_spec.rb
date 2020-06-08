# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'checkout', type: :system do
  describe 'checkout' do
    setup { driven_by(:selenium_chrome_headless) }

    let!(:product) { create(:product, name: 'Pierwszy', price: 1.11) }

    scenario 'displays product name' do
      visit '/products'
      click_link 'Pierwszy'
      expect(page.current_path).to eq "/products/#{product.id}"

      fill_in 'number_to_add', with: 4
      click_button 'Dodaj do koszyka'

      click_link 'checkout'
      expect(page).to have_text('Podaj adres')

      fill_in 'order_addresses_city', with: 'test'
      fill_in 'order_addresses_street', with: 'test2'

      click_button 'Submit'

      expect(page).to have_text('Wybierz rodzaj dostawy')

      fill_in 'delivery_method_id', with: 1

      click_button 'Submit'

      expect(page).to have_text('Wybierz rodzaj płatności')

      fill_in 'delivery_method_id', with: 2

      click_button 'Submit'

      expect(page).to have_text('Twoje zamówienie zostało złożone')
    end
  end
end
