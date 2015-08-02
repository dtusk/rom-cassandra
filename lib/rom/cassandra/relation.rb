module ROM
  module Cassandra
    class Relation < ROM::Relation

      def count
        dataset.count
      end

      def select(*args)
        "SELECT " +  "*" || args.join(', ') + " FROM #{@table}"
      end

      def where(conditions)
        " WHERE #{conditions}"
      end

      def limit(condition)
        " LIMIT #{condition}"
      end
    end
  end
end
