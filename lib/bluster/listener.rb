# encoding: utf-8

module Bluster
  module RubyesqueListenerCallbacks
    def joined(client); end
    def start_work(*args); end
    def shutdown_work(unit); end
    def left; end

    def onJoin(client); joined(client); end
    def startWork(*args); start_work(*args); end
    def shutdownWork(unit); shutdown_work(unit); end
    def onLeave; left; end
  end

  class ClusterListener < Ordasity::ClusterListener
    include RubyesqueListenerCallbacks
  end

  class SmartListener < Ordasity::SmartListener
    include RubyesqueListenerCallbacks
  end
end
