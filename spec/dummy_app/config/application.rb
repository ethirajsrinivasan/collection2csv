# frozen_string_literal: true

require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module DummyApp
  class Application < Rails::Application
    config.secret_key_base = "test_secret_key_base" * 4
  end
end
