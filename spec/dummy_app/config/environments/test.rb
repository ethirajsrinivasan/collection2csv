# frozen_string_literal: true

require_relative "../application"

Rails.application.configure do
  config.enable_reloading = false if config.respond_to?(:enable_reloading=)
  config.cache_classes = true unless config.respond_to?(:enable_reloading=)
  config.eager_load = false

  if config.public_file_server.respond_to?(:enabled=)
    config.public_file_server.enabled = true
    config.public_file_server.headers = { "Cache-Control" => "public, max-age=3600" }
  else
    config.serve_static_files = true
    config.static_cache_control = "public, max-age=3600"
  end

  config.consider_all_requests_local = true
  config.action_controller.allow_forgery_protection = false
  config.action_mailer.delivery_method = :test
  config.active_support.deprecation = :stderr
  config.secret_key_base = "test_secret_key_base" * 4
end
