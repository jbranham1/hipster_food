require 'date'

class Event
  attr_reader :name,
              :food_trucks,
              :date

  def initialize(name)
    @name = name
    @food_trucks = []
    @date = Date.today.strftime("%d/%m/%Y")
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

  def total_inventory
    items.each_with_object({}) do |item, hash|
      hash[item] = item_info(item)
    end
  end

  def items
    @food_trucks.flat_map do |truck|
      truck.inventory.keys
    end.uniq
  end

  def sorted_item_list
    items.map do |item|
      item.name
    end.sort
  end

  def overstocked_items
    items.select do |item|
      food_trucks_that_sell(item).count > 1 && inventory(item) > 50
    end
  end

  def sell(item, quantity)
    if quantity > inventory(item)
      false
    else
      food_trucks_that_sell(item).reduce(quantity) do |acc, truck|
        stock = truck.check_stock(item)
        q = stock - acc
        if q < 0
          amount = stock
          truck.stock(item, -amount)
        else
          amount = stock - q
          truck.stock(item, -amount)
        end
        acc -= amount
      end
      true
    end
  end

  private

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
end
