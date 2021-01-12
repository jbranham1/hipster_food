class FoodTruck
  attr_reader :name,
            :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, amount)
    @inventory[item] += amount
  end

  def sells_item(item)
    @inventory.keys.any? do |key|
      key.name == item.name
    end
  end

  def item_names
    @inventory.keys.map do |key|
      key.name
    end
  end

  def potential_revenue
    @inventory.sum do |key, value|
      key.price * value
    end.round(2)
  end
end
