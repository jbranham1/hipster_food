require 'minitest/pride'
require 'minitest/autorun'
require './lib/item'

class ItemTest < MiniTest::Test
  def test_it_exists
    item = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    assert_instance_of Item, item
  end
end
