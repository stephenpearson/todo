# frozen_string_literal: true

module Todo
  module Model
    # An abstract representation of a collection of Todo lists
    class Repository
      attr_accessor :store
      attr_accessor :lists

      def initialize(store)
        @store = store
      end
    end
  end
end
