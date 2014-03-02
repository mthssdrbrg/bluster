# bluster

[![Build Status](https://travis-ci.org/mthssdrbrg/bluster.png?branch=master)](https://travis-ci.org/mthssdrbrg/bluster)

Bluster is a thin JRuby wrapper around Boundary's [Ordasity](https://github.com/boundary/ordasity), and it's purpose is
merely to make the API a bit friendlier for (J)Ruby developers.

## Usage

The [docs](https://github.com/boundary/ordasity) provided by Boundary are themselves well enough to get up and running,
even without the following example.

```ruby
require 'bluster'

class SimpleListener < Bluster::ClusterListener
  def joined(client)
    puts "Joined cluster!"
    puts "Got one of them ZooKeeper clients: #{client}"
  end

  def start_work(unit)
    puts "Woohoo! Claimed this one: #{unit}"
  end

  def shutdown_work(unit)
    puts "Booh! Shutting down this one: #{unit}"
  end

  def left
    puts 'Aww, bummer, leaving'
  end
end

cluster_options = {
  :hosts => 'localhost:2181',
  :zk_timeout => 5,
  :drain_time => 1,
  :rebalance_interval => 1,
}

cluster = Bluster.create_cluster('simple', SimpleListener.new, cluster_options)
cluster.join

sleep 3

cluster.shutdown
```

There is also a very similar example in `examples/simple.rb`, though it
should be mentioned that it requires the `zk` gem as well (which is included
as a development dependency in the gemspec).

The aim of the examples was actually to have a cluster with two listeners, but
JMX didn't seem to like it when I started two listeners with the same name on
the same host, and I don't really have the time to debug that right now, so a
single listener will have to do.

## Installation

```
gem install bluster
```

## Known issues and limitations

* It is not possible to override `#initialize` when subclassing one of the
  listener classes (`Bluster::ClusterListener`, `Bluster::SmartListener`).
  I'm not really sure _WHY_, but there's probably a good reason.
  Thinking about adding some kind of convenience method / option to circumvent this.

## bluster?

Talk in a loud, aggressive, or indignant way with little effect.

## Copyright
Copyright 2013-2014 Mathias Söderberg

Licensed under the Apache License, Version 2.0 (the "License"); you may not use
this file except in compliance with the License. You may obtain a copy of the
License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed
under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
CONDITIONS OF ANY KIND, either express or implied. See the License for the
specific language governing permissions and limitations under the License.
