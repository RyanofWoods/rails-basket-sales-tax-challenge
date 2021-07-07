# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :products

  EXEMPT_SALES_TAX_CATEGORIES = %w[Book Food Medical].freeze
  BOOK = 'Book'
  FOOD = 'Food'
  MEDICAL = 'Medical'
  OTHER = 'Other'

  def exempt_from_sales_tax?
    EXEMPT_SALES_TAX_CATEGORIES.include?(name.capitalize)
  end
end
