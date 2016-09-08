require "collection2csv/version"

module Collection2csv
  class Engine < Rails::Engine
  	initializer "Collection2csv.load_app_instance_data" do |app|
      config.app_root = app.root
    end
  end
end


