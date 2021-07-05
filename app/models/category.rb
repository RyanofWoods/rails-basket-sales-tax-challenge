# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :products

  def initialize(name)
    @name = name
  end

  def exempt_from_sales_tax?
    EXEMPT_SALES_TAX_CATEGORIES.include?(name.capitalize)
  end
end
