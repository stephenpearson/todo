# frozen_string_literal: true

require 'test_helper'
require 'todo/model/item'

class ItemStoreTest < Minitest::Test
  def test_accessible_attrs
    Todo::Model::Item.new
  end
end
