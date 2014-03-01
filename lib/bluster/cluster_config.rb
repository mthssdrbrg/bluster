# encoding: utf-8

module Bluster
  class ClusterConfig
    def self.create(options = {})
      Ordasity::ClusterConfig.new.tap do |config|
        options.each do |option, value|
          config.send(wrap_with_prefix(option), value)
        end
      end
    end

    def self.wrap_with_prefix(option)
      [prefix_for(option), option].join(UNDERSCORE).to_sym
    end

    def self.prefix_for(option)
      PREFIXES[option] || SET_PREFIX
    end

    private

    SET_PREFIX = 'set'.freeze
    UNDERSCORE = '_'.freeze

    PREFIXES = {
      soft_handoff: 'set_use',
      smart_balancing: 'use'
    }.freeze
  end
end
