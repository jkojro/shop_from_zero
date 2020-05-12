# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'cart', type: :system do
  describe 'add, update and clear cart' do
    setup { driven_by(:selenium_chrome_headless) }
    before { allow_any_instance_of(ProductsController).to receive(:session).and_return({ cart_id: cart.id }) }

    let!(:product) { create(:product, name: 'Pierwszy', price: 1.11) }
    let!(:cart) { create(:cart) }

    scenario 'displays product name' do
      visit '/products'
      click_link 'Pierwszy'
      expect(page.current_path).to eq "/products/#{product.id}"

      fill_in 'cart_product_number_to_add', with: 6
      click_button 'Dodaj do koszyka'
      expect(page).to have_text('Dodałeś zbyt wiele sztuk produktu')

      fill_in 'cart_product_number_to_add', with: 4
      click_button 'Dodaj do koszyka'
      expect(page.current_path).to eq "/carts/#{cart.id}"
      expect(page).to have_text('Pierwszy')
      expect(page).to have_text('1.11 zł')
      expect(page).to have_text('Cena łącznie: 4.44 zł')

      fill_in 'cart_products_attributes_0_products_number', with: 11
      click_button 'Updejtuj'
      expect(page).to have_text('too_many_items')

      fill_in 'cart_products_attributes_0_products_number', with: 5
      click_button 'Updejtuj'
      expect(page).to have_text('Cena łącznie: 5.55 zł')

      fill_in 'cart_products_attributes_0_products_number', with: 2
      click_button 'Updejtuj'
      expect(page).to have_text('Cena łącznie: 2.22 zł')

      page.accept_confirm do
        click_link 'Wyczyść koszyk'
      end
      expect(page).not_to have_text('Pierwszy')
    end
  end
end
