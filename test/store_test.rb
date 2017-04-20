require 'test_helper'
require 'todo/store/base_store'

class StoreTest < Minitest::Test
  def test_accessible_attrs
    bs = Todo::Store::BaseStore.new
    assert_respond_to bs, :location
  end

  def test_abstract_write_methods
    bs = Todo::Store::BaseStore.new
    assert_raises NotImplementedError do
      bs.write_repository(nil)
    end
    assert_raises NotImplementedError do
      bs.write_list(nil, nil)
    end
    assert_raises NotImplementedError do
      bs.write_item(nil, nil, nil)
    end
  end

  def test_abstract_delete_methods
    bs = Todo::Store::BaseStore.new
    assert_raises NotImplementedError do
      bs.delete_repository(nil)
    end
    assert_raises NotImplementedError do
      bs.delete_list(nil, nil)
    end
    assert_raises NotImplementedError do
      bs.delete_item(nil, nil, nil)
    end
  end
end
