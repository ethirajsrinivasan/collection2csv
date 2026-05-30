# frozen_string_literal: true

Rails.application.routes.draw do
  mount Collection2csv::Engine => "/"
end
