# frozen_string_literal: true

Category.destroy_all
Product.destroy_all

books = Category.create(name: Category::BOOK)
food = Category.create(name: Category::FOOD)
medical = Category.create(name: Category::MEDICAL)
other = Category.create(name: Category::OTHER)

Product.create(name: 'book', category_id: books.id)
Product.create(name: 'music CD', category_id: other.id)
Product.create(name: 'chocolate', category_id: food.id)
Product.create(name: 'bottle of perfume', category_id: other.id)
Product.create(name: 'packet of headache pills', category_id: medical.id)
