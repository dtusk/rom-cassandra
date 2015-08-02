require 'rom'

require "rom/cassandra/version"
require 'rom/cassandra/gateway'
require 'rom/cassandra/dataset'
require 'rom/cassandra/relation'
require 'rom/cassandra/commands/create'
require 'rom/cassandra/commands/update'
require 'rom/cassandra/commands/delete'

ROM.register_adapter(:cassandra, ROM::Cassandra)
