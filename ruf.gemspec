# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruf/version'

Gem::Specification.new do |spec|
  spec.name          = "ruf"
  spec.version       = Ruf::VERSION
  spec.authors       = ["Jon-Erling Dahl", "Niclas Nilsson"]
  spec.email         = ["code@fooheads.com"]
  spec.description   = %q{Ruby Futures}
  spec.summary       = %q{Ruby Futures}
  spec.homepage      = "https://github.com/fooheads/ruf"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
