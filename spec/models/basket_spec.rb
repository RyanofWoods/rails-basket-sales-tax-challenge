# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Basket' do
  context 'items' do
    it 'can add item' do
      category = Category.new(name: Category::BOOK)
      product = LineItem.new(name: 'book', quantity: 2, base_price: 10.00, imported: true, category: category)
      basket = Basket.new

      basket.add(product)

      expect(basket.items.class).to be(Array)
      expect(basket.items.length).to eq(1)
      expect(basket.items.first.class).to be(LineItem)
    end
  end

  context 'total and total_sales_tax' do
    context 'returns correctly' do
      it 'example 1' do
        book_category = Category.new(name: Category::BOOK)
        other_category = Category.new(name: Category::OTHER)
        food_category = Category.new(name: Category::FOOD)
        book = LineItem.new(name: 'book', quantity: 1, base_price: 12.49, imported: false, category: book_category)
        music_cd = LineItem.new(name: 'cd', quantity: 1, base_price: 14.99, imported: false, category: other_category)
        food = LineItem.new(name: 'food', quantity: 1, base_price: 0.85, imported: false, category: food_category)
        basket = Basket.new
        basket.add(book)
        basket.add(music_cd)
        basket.add(food)

        basket_total = basket.total
        basket_total_sales_tax = basket.total_sales_tax

        expect(basket_total).to eq(29.83)
        expect(basket_total_sales_tax).to eq(1.5)
      end

      it 'example 2' do
        other_category = Category.new(name: Category::OTHER)
        food_category = Category.new(name: Category::FOOD)
        imported_food = LineItem.new(name: 'food', quantity: 1, base_price: 10.00, imported: true,
                                     category: food_category)
        perfume = LineItem.new(name: 'perfume', quantity: 1, base_price: 47.50, imported: true,
                               category: other_category)
        basket = Basket.new
        basket.add(imported_food)
        basket.add(perfume)

        basket_total = basket.total
        basket_total_sales_tax = basket.total_sales_tax

        expect(basket_total).to eq(65.15)
        expect(basket_total_sales_tax).to eq(7.65)
      end

      it 'example 3' do
        other_category = Category.new(name: Category::OTHER)
        medical_category = Category.new(name: Category::MEDICAL)
        food_category = Category.new(name: Category::FOOD)
        imported_perfume = LineItem.new(name: 'imported perfume', quantity: 1, base_price: 27.99, imported: true,
                                        category: other_category)
        perfume = LineItem.new(name: 'perfume', quantity: 1, base_price: 18.99, imported: false,
                               category: other_category)
        pills = LineItem.new(name: 'medical pills', quantity: 1, base_price: 9.75, imported: false,
                             category: medical_category)
        food = LineItem.new(name: 'imported food', quantity: 1, base_price: 11.25, imported: true,
                            category: food_category)
        basket = Basket.new
        basket.add(imported_perfume)
        basket.add(perfume)
        basket.add(pills)
        basket.add(food)

        basket_total = basket.total
        basket_total_sales_tax = basket.total_sales_tax

        expect(basket_total).to eq(74.68)
        expect(basket_total_sales_tax).to eq(6.7)
      end
    end
  end
end
