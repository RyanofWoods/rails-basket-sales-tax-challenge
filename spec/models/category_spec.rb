# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Category' do
  context 'exempt_from_sales_tax?' do
    it 'true for books' do
      book_category = Category.new(name: Category::BOOK)

      is_exempt = book_category.exempt_from_sales_tax?

      expect(is_exempt).to eq(true)
    end

    it 'true for food' do
      food_category = Category.new(name: Category::FOOD)

      is_exempt = food_category.exempt_from_sales_tax?

      expect(is_exempt).to eq(true)
    end

    it 'true for medical items' do
      medical_category = Category.new(name: Category::MEDICAL)

      is_exempt = medical_category.exempt_from_sales_tax?

      expect(is_exempt).to eq(true)
    end

    it 'returns false for any other item' do
      other_category = Category.new(name: Category::OTHER)

      is_exempt = other_category.exempt_from_sales_tax?

      expect(is_exempt).to eq(false)
    end
  end
end
