require 'minitest/pride'
require 'minitest/autorun'
require './lib/event'
require './lib/food_truck'

class EventTest < MiniTest::Test
  def test_it_exists
    event = Event.new("South Pearl Street Farmers Market")
    assert_instance_of Event, event
  end

  def test_it_has_readable_attributes
    event = Event.new("South Pearl Street Farmers Market")

    assert_equal 'South Pearl Street Farmers Market', event.name
    assert_equal [], event.food_trucks
  end

  def test_add_food_truck
    event = Event.new("South Pearl Street Farmers Market")
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    event.add_food_truck(food_truck)

    assert_equal [food_truck], event.food_trucks
  end

  def test_food_truck_names
    event = Event.new("South Pearl Street Farmers Market")
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    food_truck3 = FoodTruck.new("Palisade Peach Shack")

    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)

    names = ["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"]
    assert_equal names, event.food_truck_names
  end
end
