class Event
  attr_reader :name,
            :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map(&:name)
  end

  def food_trucks_that_sell(item)
    @food_trucks.select do |food_truck|
      food_truck.sells_item(item)
    end
  end

  def sorted_item_list
    items.each_with_object({}) do |item, hash|
      hash[item] = item_info(item)
    end
  end

  def items
    @food_trucks.flat_map do |truck|
      truck.inventory.keys
    end.uniq
  end

  def inventory(item)
    food_trucks_that_sell(item).sum do |truck|
      truck.check_stock(item)
    end
    end

  def item_info(item)
    {
      quantity: inventory(item),
      food_trucks: food_trucks_that_sell(item)
    }
  end

  def overstocked_items
    items.select do |item|
      food_trucks_that_sell(item).count > 1 && inventory(item) > 50
    end
  end
end
