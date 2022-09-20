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

  def sorted_item_list
    vendor_items = @vendors.map {|vendor| vendor.inventory_names}
    vendor_items.flatten.uniq.sort
  end

  def total_inventory
    inventory_hash = Hash.new
    @vendors.each do |vendor|
      vendor.inventory.each do |item, stock|
        if inventory_hash[item] == nil
          inventory_hash[item] = Hash.new
          inventory_hash[item][:quantity] = stock
          inventory_hash[item][:vendors] = [vendor]
        else
          inventory_hash[item][:quantity] += stock
          inventory_hash[item][:vendors] += [vendor]
        end
      end
    end
    inventory_hash
  end

  def overstocked_items
    self.total_inventory.select {|item, info| info[:quantity] > 50 && info[:vendors].count > 1}.keys
  end
end
