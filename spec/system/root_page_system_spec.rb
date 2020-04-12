require "rails_helper"

RSpec.describe "Root page", :type => :system do
  before { driven_by(:rack_test) }

  describe 'goes from main page to clicked product'do
    before { 3.times { create(:product) }}

    it 'displays product name' do
      visit '/products'
      expect(page).to have_text('Product 1')
      expect(page).to have_text('Product 2')
      expect(page).to have_text('Product 3')
      expect(page).to have_text('3.33 zł')
      click_link "Product 3"
      expect(page.current_path).to eq '/products/3'
      expect(page).to have_text('Product description')
    end
  end
end
