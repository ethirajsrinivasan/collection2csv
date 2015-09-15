# ENGINE/config/routes.rb
Rails.application.routes.draw do
  get "/collection2csv" => "collection2csv#convert"
end
