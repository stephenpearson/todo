# frozen_string_literal: true

module Todo
  module Model
    # An abstract representation of a collection of Todo lists
    class Repository
      attr_accessor :store
      attr_accessor :lists

      def initialize(store)
        @store = store
        @lists = []
      end

      def add_list(list)
        lists << list
        @store.write_list(list, self)
      end

      def remove_list(list)
        @lists = @lists.reject { |l| l.id == list.id }
        @store.delete_list(list, self)
      end

      def find_list_by_id(i)
        @lists.select { |l| l.id == i }.first
      end
    end
  end
end
