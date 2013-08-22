# encoding: utf-8

require 'bluster'
require 'zk'

def log(name, message)
  puts "[#{name}] #{message}"
end

class SimpleListener < Bluster::ClusterListener

  attr_accessor :name

  def joined(client)
    log name, "Joined cluster!"
    log name, "Got one of them ZooKeeper clients: #{client}"
  end

  def start_work(unit)
    log name, "Woohoo! Claimed this one: #{unit}"
  end

  def shutdown_work(unit)
    log name, "Booh! Shutting down this one: #{unit}"
  end

  def left
    log name, 'Aww, bummer, leaving'
  end
end

cluster_options = {
  hosts: 'localhost:2181',
  zk_timeout: 5,
  drain_time: 1,
  rebalance_interval: 1,
}

log 'boss', 'Starting first cluster'

first_listener = SimpleListener.new
first_listener.name = 'node'

first_cluster = Bluster.create_cluster('simple', first_listener, cluster_options)
first_cluster.join

log 'boss', 'Started first cluster, waiting a bit'
sleep 2

log 'boss', 'Up again, creating work units (if they don\'t already exist that is)'

ZK.open do |zk|
  %w[first second third].each do |name|
    zk.create("/work-units/#{name}") unless zk.exists?("/work-units/#{name}")
  end
end

log 'boss', 'Alright, created work units, gonna sleep for a while'
sleep 3

log 'boss', 'Alright, slept for a bit, terminating cluster'
first_cluster.shutdown

log 'boss', 'Initiated shutdown of cluster, sleeping for a few seconds'
sleep 5

log 'boss', 'Alright, I\'m done with this, exiting'

# For some reason Ordasity refuses to shut down properly, or it's just waiting
# for a SIGINT or something, I dunno. Kill that.
exit
