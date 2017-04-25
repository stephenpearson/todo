# frozen_string_literal: true

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength

require 'test_helper'
require 'todo/model/repository'
require 'todo/store/base_store'
require 'ostruct'

class RepositoryStoreTest < Minitest::Test
  def test_accessible_attrs
    store = Object.new
    repo = Todo::Model::Repository.new(store)
    assert_respond_to repo, :store
    assert_respond_to repo, :lists
    assert_same repo.store, store
  end

  def test_repository_add_list
    # Create a dummy list
    list = OpenStruct.new
    list.id = 1

    # Create repository with mocked store
    mock_store = Minitest::Mock.new
    repo = Todo::Model::Repository.new(mock_store)

    mock_store.expect :write_list, nil, [list, repo]
    mock_store.expect :delete_list, nil, [list, repo]
    repo.add_list(list)
    assert_equal list.id, repo.lists.first.id
    assert_equal 1, repo.lists.size

    repo.remove_list(list)
    assert_empty repo.lists

    mock_store.verify
  end

  def test_find_list_by_id
    mock_store = Minitest::Mock.new
    repo = Todo::Model::Repository.new(mock_store)

    [1, 2, 3].each do |i|
      list = OpenStruct.new
      list.id = i
      mock_store.expect :write_list, nil, [list, repo]
      repo.add_list(list)
    end

    assert 1, repo.find_list_by_id(1).id
    assert 2, repo.find_list_by_id(2).id
    assert 3, repo.find_list_by_id(3).id
    assert_equal nil, repo.find_list_by_id(4)

    mock_store.verify
  end
end
