# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'collection2csv/version'

Gem::Specification.new do |spec|
  spec.name          = "collection2csv"
  spec.version       = Collection2csv::VERSION
  spec.authors       = ["ethiraj"]
  spec.email         = ["ethirajsrinivasan@gmail.com"]

  spec.summary       = "Download ActiveRecord collection as csv"
  spec.description   = "Download ActiveRecord collection as csv"
  spec.homepage      = "https://github.com/ethirajsrinivasan/collection2csv"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.test_files    = `git ls-files -- Appraisals {spec,gemfiles}/*`.split("\n")
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.required_ruby_version = '>= 2.0.0'
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "appraisal"

end
