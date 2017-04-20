module Todo
  module Store
    # The abstract BaseStore class, parent of all stores
    class BaseStore
      attr_reader :location

      def write_repository(_repository)
        raise NotImplementedError
      end

      def write_list(_list, _repository)
        raise NotImplementedError
      end

      def write_item(_item, _list, _repository)
        raise NotImplementedError
      end

      def delete_repository(_repository)
        raise NotImplementedError
      end

      def delete_list(_list, _repository)
        raise NotImplementedError
      end

      def delete_item(_item, _list, _repository)
        raise NotImplementedError
      end
    end
  end
end
