require 'test_helper'
require 'todo/model/item'

class BaseStoreTest < Minitest::Test
  def test_accessible_attrs
    Todo::Model::Item.new
  end
end
