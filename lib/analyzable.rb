module Analyzable

  def average_price(products)
    total = products.inject(0) { |sum, product| sum + product.price.to_f }
    (total / products.size).round(2)
  end

  def print_report(products)
    'Report has been printed'
  end

  def count_by_brand(products)
    products.each_with_object(Hash.new(0)) { |product, counters| counters[product.brand] += 1 }
  end

  def count_by_name(products)
    products.each_with_object(Hash.new(0)) { |product, counters| counters[product.name] += 1 }
  end

end
