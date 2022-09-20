class Vendor
  attr_reader :name, :inventory, :inventory_names
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
    @inventory_names = []
  end
  def check_stock(item)
    @inventory[item]
  end
  def stock(item, amount)
    @inventory[item] += amount
    @inventory_names << item.name
  end
  def potential_revenue
    @inventory.sum do |item, amount|
      amount * item.price
    end
  end
end
