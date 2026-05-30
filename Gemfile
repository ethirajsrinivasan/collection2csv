# frozen_string_literal: true

source "https://rubygems.org"

gemspec

if (rails_version = ENV.fetch("RAILS_VERSION", nil))
  gem "rails", "~> #{rails_version}.0"
else
  gem "rails", "~> 7.1.0"
end
