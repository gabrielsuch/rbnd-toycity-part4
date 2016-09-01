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

  def self.all
    products = []

    CSV.foreach( @@file, headers: true ) do |line|
      products << self.new( id: line["id"], brand: line["brand"], name: line["product"], price: line["price"] )
    end

    products
  end

  def self.first(n=0)
    return self.all.first if n == 0
    self.all[0 .. n-1]
  end

  def self.last
    self.all.last
  end

end
