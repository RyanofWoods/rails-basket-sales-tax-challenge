# frozen_string_literal: true

module ProductListFileHandler
  FILE_LINE_REGEXP = /\A(?<quantity>\d*) ?(?<name>.+) at (?<price>\d+.?\d*)/.freeze

  def self.parse_and_return_basket(file)
    basket = Basket.new

    File.open(file, 'r').each_line do |line|
      named_captures = line.match FILE_LINE_REGEXP

      return nil unless named_captures

      name = named_captures[:name]
      category = Product.select { |product| name.include? product.name }&.first&.category
      quantity = named_captures[:quantity]&.to_i || 1
      price = named_captures[:price]&.to_f || 0
      is_imported = find_if_imported_by_name(name)

      basket.items << LineItem.new(name: name, quantity: quantity,
                                   category: category, base_price: price,
                                   imported: is_imported)
    end

    basket
  end

  def self.find_if_imported_by_name(name)
    name.match?(/import/)
  end
end
