# encoding: utf-8

module Bluster
  class ClusterConfig
    def self.create(options = {})
      config = Ordasity::ClusterConfig.new

      options.each do |option, value|
        config.send(wrap_with_prefix(option), value)
      end

      config
    end

    def self.wrap_with_prefix(option)
      [prefix_for(option), option].join(UNDERSCORE).to_sym
    end

    def self.prefix_for(option)
      PREFIXES[option] || SET_PREFIX
    end

    SET_PREFIX = 'set'.freeze
    UNDERSCORE = '_'.freeze

    PREFIXES = {
      soft_handoff: 'set_use',
      smart_balancing: 'use'
    }.freeze

  end
end
