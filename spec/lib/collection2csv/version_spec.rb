# frozen_string_literal: true

require "rails_helper"

RSpec.describe Collection2csv do
  it "has a version number" do
    expect(Collection2csv::VERSION).to eq "1.0.0"
  end

  it "defines a Rails engine" do
    expect(Collection2csv::Engine).to be < Rails::Engine
  end
end
