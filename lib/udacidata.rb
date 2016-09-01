require_relative 'find_by'
require_relative 'errors'
require 'csv'

class Udacidata

  @@file = File.dirname(__FILE__) + "/../data/data.csv"

  def self.create(args={})
    product = self.new(args)

    CSV.open(@@file, "a+") do |csv|
      csv << [product.id, product.brand, product.name, product.price]
    end

    product
  end

end
