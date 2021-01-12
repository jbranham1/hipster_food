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
end
