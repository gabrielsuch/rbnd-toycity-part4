require_relative 'find_by'
require_relative 'errors'
require 'csv'

class Udacidata
  create_finder_methods :brand, :name

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

  def self.first(n=1)
    n == 1 ? all.first : all.first(n)
  end

  def self.last(n=1)
    n == 1 ? all.last : all.last(n)
  end

  def self.find(id)
    result = all.find { |product| product.id == id }
    raise ProductNotFoundError, "Product with #{id} was not found" unless result
    result
  end

  def self.destroy(id)
    csv_table = CSV.table(@@file)
    deleted = find(id)
    csv_table.delete_if { |product| product[:id] == id }

    File.open(@@file, "w") do |writer|
      writer.write(csv_table.to_csv)
    end

    deleted
  end

  def self.where(args = {})
    all.select { |product| args[:brand] == product.brand || args[:name] == product.name }
  end

  def update(args = {})
    @brand = args[:brand] if args[:brand]
    @name = args[:name] if args[:name]
    @price = args[:price] if args[:price]
    Product.destroy(@id)
    Product.create(id: @id, brand: @brand, name: @name, price: @price)
  end

end
