# encoding: utf-8

$: << File.expand_path('../lib', __FILE__)

require 'bluster/version'

Gem::Specification.new do |s|
  s.name        = 'bluster'
  s.version     = Bluster::VERSION
  s.platform    = 'java'
  s.authors     = ['Mathias Söderberg']
  s.email       = ['mathias.soederberg@gmail.com']
  s.homepage    = 'http://github.com/mthssdrbrg/bluster'
  s.summary     = %q{Bluster is a thin JRuby wrapper for Ordasity}
  s.description = %q{}

  s.rubyforge_project = 'bluster'

  s.add_dependency 'ordasity-jars', '~> 0.5.3'
  s.add_development_dependency 'rspec'

  s.files         = `git ls-files`.split("\n")
  s.require_paths = %w(lib)
end
