# frozen_string_literal: true

require "logger"

ENV["RAILS_ENV"] = "test"

require File.expand_path("dummy_app/config/environment", __dir__)

require "rspec/rails"
require "database_cleaner/active_record"

Dir[File.expand_path("support/**/*.rb", __dir__)].each { |f| require f }

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include ConvertorHelper

  config.before(:suite) do
    unless ActiveRecord::Base.connection.table_exists?(:users)
      ActiveRecord::Schema.verbose = false
      load File.expand_path("dummy_app/db/schema.rb", __dir__)
    end
  end

  config.before do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
  end

  config.after do
    DatabaseCleaner.clean
  end
end
