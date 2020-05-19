# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'cart', type: :system do
  describe 'add, update and clear cart' do
    setup { driven_by(:selenium_chrome_headless) }

    let!(:product) { create(:product, name: 'Pierwszy', price: 1.11) }

    scenario 'displays product name' do
      visit '/products'
      click_link 'Pierwszy'
      expect(page.current_path).to eq "/products/#{product.id}"

      fill_in 'number_to_add', with: 6
      click_button 'Dodaj do koszyka'
      expect(page).to have_text('Invalid quantity')

      fill_in 'number_to_add', with: 4
      click_button 'Dodaj do koszyka'
      expect(page.current_path).to eq "/cart"
      expect(page).to have_text('Pierwszy')
      expect(page).to have_text('1.11 zł')
      expect(page).to have_text('Cena łącznie: 4.44 zł')

      fill_in "items_#{product.id}", with: 11
      click_button 'Updejtuj'
      expect(page).to have_text('Invalid quantity')

      fill_in "items_#{product.id}", with: 5
      click_button 'Updejtuj'
      expect(page).to have_text('Cena łącznie: 5.55 zł')

      fill_in "items_#{product.id}", with: 2
      click_button 'Updejtuj'
      expect(page).to have_text('Cena łącznie: 2.22 zł')

      page.accept_confirm do
        click_link 'Wyczyść koszyk'
      end
      expect(page).not_to have_text('Pierwszy')
    end
  end
end
