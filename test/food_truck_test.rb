require 'minitest/pride'
require 'minitest/autorun'
require './lib/food_truck'

class FoodTruckTest < MiniTest::Test
  def test_it_exists
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    assert_instance_of FoodTruck, food_truck
  end
end
