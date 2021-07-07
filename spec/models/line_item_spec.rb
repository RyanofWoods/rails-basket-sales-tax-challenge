# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'LineItem' do
  context 'category' do
    it 'has a category' do
      food_category = Category.create(name: Category::FOOD)
      product = LineItem.new(name: 'Chocolate', quantity: 1, base_price: 0.85, imported: false, category: food_category)

      expect(product.category).to eq(food_category)
    end
  end

  context 'shelf price' do
    it 'returns correct shelf price music_cds (no sales tax)' do
      book_category = Category.create(name: Category::BOOK)
      book_base_price = 12.49
      book = LineItem.new(name: 'Learn Rails', quantity: 1, base_price: book_base_price, imported: false,
                          category: book_category)

      shelf_price = book.shelf_price

      expect(shelf_price).to eq(book_base_price)
    end

    it 'returns correct music cds (only basic sales tax)' do
      other_category = Category.new(name: Category::OTHER)
      music_cd_base_price = 14.99
      music_cd = LineItem.new(name: 'Songs CD', quantity: 1, base_price: music_cd_base_price, imported: false,
                              category: other_category)

      shelf_price = music_cd.shelf_price

      expect(shelf_price).to eq(16.49)
    end

    it 'returns correct shelf price imported food (no basic sales tax, but import tax)' do
      food_category = Category.new(name: Category::FOOD)
      food_base_price = 10.00
      chocolates = LineItem.new(name: 'Box of chocolates', quantity: 1, base_price: food_base_price, imported: true,
                                category: food_category)

      shelf_price = chocolates.shelf_price

      expect(shelf_price).to eq(10.50)
    end

    it 'returns correct shelf price imported perfume (basic sales tax and import tax)' do
      other_category = Category.new(name: Category::OTHER)
      perfume_base_price = 47.50
      perfume = LineItem.new(name: 'perfume', quantity: 1, base_price: perfume_base_price, imported: true,
                             category: other_category)

      shelf_price = perfume.shelf_price

      expect(shelf_price).to eq(54.65)
    end
  end
end
