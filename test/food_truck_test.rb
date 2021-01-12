require 'minitest/pride'
require 'minitest/autorun'
require './lib/food_truck'
require './lib/item'

class FoodTruckTest < MiniTest::Test
  def test_it_exists
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    assert_instance_of FoodTruck, food_truck
  end

  def test_it_has_readable_attributes
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    assert_equal 'Rocky Mountain Pies', food_truck.name
    assert_equal Hash.new, food_truck.inventory
  end

  def test_check_stock
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    assert_equal 0, food_truck.check_stock(item)

    food_truck.stock(item, 30)
    assert_equal 30, food_truck.check_stock(item)
  end

  def test_stock
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

    food_truck.stock(item, 30)
    hash = { item => 30 }
    assert_equal hash, food_truck.inventory
  end
end
