# encoding: utf-8

require 'spec_helper'

module Bluster
  shared_examples_for 'a Rubyesque listener' do
    let :listener do
      described_class.new
    end

    it 'responds to #joined' do
      listener.should respond_to(:joined)
    end

    it 'responds to #start_work' do
      listener.should respond_to(:start_work)
    end

    it 'responds to #shutdown_work' do
      listener.should respond_to(:shutdown_work)
    end

    it 'responds to #left' do
      listener.should respond_to(:left)
    end
  end

  describe ClusterListener do
    it_behaves_like 'a Rubyesque listener'
  end

  describe SmartListener do
    it_behaves_like 'a Rubyesque listener'
  end
end
