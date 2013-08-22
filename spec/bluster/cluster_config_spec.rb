require 'spec_helper'

module Bluster
  describe ClusterConfig do
    describe '.create' do
      let :config do
        Bluster::ClusterConfig.create({
          hosts: 'localhost:2181,localhost:2182',
          auto_rebalance: true,
          rebalance_interval: 10,
          drain_time: 10,
          smart_balancing: true,
          zk_timeout: 2000,
          work_unit_name: 'work-units',
          work_unit_short_name: 'work',
          node_id: '1234',
          soft_handoff: true,
          handoff_shutdown_delay: 10
        })
      end

      it 'creates a Ordasity::ClusterConfig object with given options' do
        config.hosts.should == 'localhost:2181,localhost:2182'
        config.enableAutoRebalance.should be_true
        config.autoRebalanceInterval.should == 10
        config.drainTime.should == 10
        config.useSmartBalancing.should be_true
        config.zkTimeout.should == 2000
        config.workUnitName.should == 'work-units'
        config.workUnitShortName.should == 'work'
        config.nodeId.should_not be_nil
        config.useSoftHandoff.should be_true
        config.handoffShutdownDelay.should == 10
      end
    end
  end
end
