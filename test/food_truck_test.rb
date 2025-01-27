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
    food_truck.stock(item, 30)
    hash = { item => 60 }
    assert_equal hash, food_truck.inventory
  end

  def test_sells_item
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

    assert_equal false, food_truck.sells_item(item)
    food_truck.stock(item, 30)

    assert_equal true, food_truck.sells_item(item)
  end

  def test_potential_revenue
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    food_truck.stock(item1, 35)
    food_truck.stock(item2, 7)

    assert_equal 148.75, food_truck.potential_revenue
  end

  def test_item_names
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    food_truck.stock(item1, 35)
    food_truck.stock(item2, 7)

    assert_equal ["Peach Pie (Slice)", "Apple Pie (Slice)"], food_truck.item_names
  end
end
