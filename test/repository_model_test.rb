# frozen_string_literal: true

require 'test_helper'
require 'todo/model/repository'
require 'todo/store/base_store'

class RepositoryStoreTest < Minitest::Test
  def test_accessible_attrs
    store = Todo::Store::BaseStore
    repo = Todo::Model::Repository.new(store)
    assert_respond_to repo, :store
    assert_respond_to repo, :lists
    assert_same repo.store, store
  end
end
