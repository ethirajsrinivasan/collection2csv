# frozen_string_literal: true

require "logger"
require "mutex_m" if Gem::Version.new(RUBY_VERSION) >= Gem::Version.new("3.3.0")

ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../../../Gemfile", __dir__)

require "bundler/setup"
