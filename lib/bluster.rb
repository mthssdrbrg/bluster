# encoding: utf-8

require 'ordasity'

require 'bluster/cluster_config'
require 'bluster/listener'

module Bluster
  def self.create_cluster(name, listener, options = {})
    config = Bluster::ClusterConfig.create(options)
    Ordasity::Cluster.new(name, listener, config)
  end
end
