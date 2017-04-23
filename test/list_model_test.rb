require 'test_helper'
require 'todo/model/list'

class BaseStoreTest < Minitest::Test
  def test_accessible_attrs
    Todo::Model::List.new
  end
end
