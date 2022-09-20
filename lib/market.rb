class Market
  attr_reader :name, :vendors
  def initialize(name)
    @name = name
    @vendors = []
  end
  def add_vendor(vendor)
    @vendors << vendor
  end
  def vendor_names
    @vendors.map {|vendor| vendor.name}
  end
  def vendors_that_sell(item)
    vendors_selling = @vendors.map {|vendor| vendor if vendor.inventory[item] > 0}
    vendors_selling.compact
  end
end
