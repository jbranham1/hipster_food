require 'minitest/pride'
require 'minitest/autorun'
require './lib/event'

class EventTest < MiniTest::Test
  def test_it_exists
    event = Event.new("South Pearl Street Farmers Market")
    assert_instance_of Event, event
  end
end
