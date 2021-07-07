# frozen_string_literal: true

class LineItem
  include Rounding

  TAX_PRECISION = 0.05
  BASIC_SALES_TAX_DECIMAL = 0.1
  IMPORT_TAX_DECIMAL = 0.05

  attr_reader :name, :quantity, :base_price, :category

  def initialize(name:, quantity:, base_price:, imported:, category:)
    @name = name
    @base_price = base_price
    @quantity = quantity
    @imported = imported
    @category = category
  end

  def sales_tax
    @sales_tax ||= calculate_sales_tax
  end

  def shelf_price
    (@base_price * @quantity + sales_tax).round(2)
  end

  private

  def calculate_sales_tax
    tax_percentage_multipler = 0
    tax_percentage_multipler += BASIC_SALES_TAX_DECIMAL unless exempt_from_sales_tax?
    tax_percentage_multipler += IMPORT_TAX_DECIMAL if imported?

    return 0 if tax_percentage_multipler.zero?

    unrounded_sales_tax = @base_price * @quantity * tax_percentage_multipler
    rounded_sales_tax = Rounding.up_to_nearest(nearest: TAX_PRECISION, number: unrounded_sales_tax)
    rounded_sales_tax.round(2)
  end

  def exempt_from_sales_tax?
    @category&.exempt_from_sales_tax?
  end

  def imported?
    @imported
  end
end
