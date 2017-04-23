# frozen_string_literal: true

require 'test_helper'
require 'todo/model/list'

class ListStoreTest < Minitest::Test
  def test_accessible_attrs
    Todo::Model::List.new
  end
end
