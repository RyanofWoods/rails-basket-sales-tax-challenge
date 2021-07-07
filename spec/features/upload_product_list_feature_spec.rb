# frozen_string_literal: true

require_relative '../helpers/test_seeds'

describe 'Upload product list', type: :feature do
  before :all do
    create_categories_and_products
  end

  it 'can upload product list and shows correct content/data' do
    visit '/'
    find('form input[type="file"]').set("#{Rails.root}/spec/features/product_lists/basket_1.txt")
    click_button 'Submit'

    content = ['- 1 book: 12.49', '- 1 music CD: 16.49', '- 1 chocolate bar: 0.85', '- Sales Taxes: 1.50',
               '- Total: 29.83']
    content.each do |string|
      expect(page).to have_content string
    end
  end
end
