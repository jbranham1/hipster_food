class FoodTruck
  attr_reader :name,
            :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new
  end

  def check_stock(item)
    if @inventory[item]
      @inventory[item]
    else
      0
    end
  end

  def stock(item, amount)
    @inventory[item] = amount
  end
end
