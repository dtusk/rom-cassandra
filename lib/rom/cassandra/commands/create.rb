require 'rom/commands/create'

module ROM
  module Cassandra
    module Commands
      class Create < ROM::Commands::Create

        def execute(object)
          relation.dataset.insert(object)
        end

      end
    end
  end
end
