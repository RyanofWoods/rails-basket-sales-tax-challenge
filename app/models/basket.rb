# frozen_string_literal: true

class Basket
  def items
    @items ||= []
  end

  def add(product)
    items << product
  end

  def total_sales_tax
    items.sum(&:sales_tax).round(2)
  end

  def total
    items.sum(&:shelf_price).round(2)
  end
end
