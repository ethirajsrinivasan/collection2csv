# frozen_string_literal: true

source "https://rubygems.org"

gemspec

rails_version = ENV.fetch("RAILS_VERSION", "8.1")

gem "rails", "~> #{rails_version}.0"

if rails_version.to_f >= 7.2
  gem "sqlite3", ">= 2.1"
else
  gem "sqlite3", "~> 1.4"
end

if rails_version == "6.0"
  gem "rspec-rails", "~> 5.1"
elsif rails_version == "6.1"
  gem "rspec-rails", "~> 6.0"
else
  gem "rspec-rails", "~> 6.1"
end
