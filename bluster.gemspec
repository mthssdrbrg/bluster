# encoding: utf-8

$: << File.expand_path('../lib', __FILE__)

require 'bluster/version'

Gem::Specification.new do |s|
  s.name        = 'bluster'
  s.version     = Bluster::VERSION
  s.authors     = ['Mathias Söderberg']
  s.email       = ['mths@sdrbrg.se']
  s.homepage    = 'http://github.com/mthssdrbrg/bluster'
  s.summary     = %q{Bluster is a thin JRuby wrapper for Ordasity}
  s.description = s.summary + "\n"
  s.license     = 'Apache License 2.0'

  s.add_dependency 'ordasity-jars', '= 0.5.3'
  s.add_development_dependency 'zk'

  s.files         = Dir['lib/**/*.rb', 'README.md']
  s.test_files    = Dir['spec/**/*.rb']
  s.require_paths = %w(lib)

  s.platform              = 'java'
  s.required_ruby_version = '>= 1.9.2'
end
