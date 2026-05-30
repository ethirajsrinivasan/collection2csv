# frozen_string_literal: true

Rails.application.routes.draw do
  get "/collection2csv(.:format)" => "collection2csv#convert", as: :collection2csv, defaults: { format: "csv" }
end
