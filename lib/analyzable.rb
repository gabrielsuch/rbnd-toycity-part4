module Analyzable

  def average_price(products)
    total = products.inject(0) { |sum, product| sum + product.price.to_f }
    (total / products.size).round(2)
  end

  def print_report(products)
    print_title "Inventory by Brand:"

    count_by_brand(products).each do |key, value|
      puts "#{key}: #{value}"
    end

    print_title "Inventory by Name:"

    count_by_name(products).each do |key, value|
      puts "#{key}: #{value}"
    end

    print_title "Average Price: #{average_price(products)}"
  end

  private def print_title(title)
    puts
    puts "*" * 30
    puts title
    puts "*" * 30
  end

  def count_by_brand(products)
    products.each_with_object(Hash.new(0)) { |product, counters| counters[product.brand] += 1 }
  end

  def count_by_name(products)
    products.each_with_object(Hash.new(0)) { |product, counters| counters[product.name] += 1 }
  end

end
