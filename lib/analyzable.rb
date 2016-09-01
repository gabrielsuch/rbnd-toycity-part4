module Analyzable

  def average_price(products)
    total = products.inject(0) { |sum, product| sum + product.price.to_f }
    (total / products.size).round(2)
  end

  def print_report(products)
    'Report has been printed'
  end

end
