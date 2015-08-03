require 'rom/commands/delete'

module ROM
  module Cassandra
    module Commands
      class Delete < ROM::Commands::Delete
        def execute(object)
          relation.dataset.destroy(object)
        end
      end
    end
  end
end
