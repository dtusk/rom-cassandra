require 'cassandra'

module ROM
  module Cassandra
    class Gateway < ROM::Gateway

      attr_reader :datasets

      def initialize(keyspace = 'system', options = {})
        @cluster = ::Cassandra.cluster(options)
        @keyspace = keyspace
        @datasets = {}
      end

      def dataset(table)
        datasets[table] = Dataset.new(@cluster, @keyspace, table)
      end

      def [](table)
        datasets.fetch(table)
      end

      def dataset?(table)
        datasets.include?(table)
      end
    end
  end
end
