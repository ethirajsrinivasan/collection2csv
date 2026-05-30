# frozen_string_literal: true

require "collection2csv/version"
require "collection2csv/convertor"

module Collection2csv
  class Engine < Rails::Engine
    initializer "collection2csv.load_app_instance_data" do |app|
      config.app_root = app.root
    end
  end
end
