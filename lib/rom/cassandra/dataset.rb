require 'cassandra'
require 'rom/sql'

module ROM
  module Cassandra
    class Dataset

      attr_reader :session

      def initialize(cluster, keyspace, table)
        @cluster = cluster
        @session = cluster.connect(keyspace)
        @table = table
      end

      def insert(object)
        statement = session.prepare(
          "INSERT INTO #{@table} (#{object.keys.join(', ')}) VALUES (#{object.map { '?' }.join(',')})")

        session.execute(statement, arguments: object.values)
      end


      def update(object)
        statement = session.prepare(
          "UPDATE #{@table} SET " + object.map { |k, _| "#{k} = ?"}.join(' , ') + " WHERE "
        )

        session.execute(statement, arguments: object.values)
      end


      def destroy(object)
        statement = session.prepare(
          "DELETE * FROM #{@table} WHERE " + object.map { |k, _| "#{k} = ?" }.join(' AND ')
        )

        session.execute(statement, arguments: object.arguments)
      end
    end
  end
end
