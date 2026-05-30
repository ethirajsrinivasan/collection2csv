# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Collection2csv export", type: :request do
  let(:params) { { klass: "User", ids: [1, 2] } }

  before do
    User.create!(name: "ethiraj")
    User.create!(name: "srinivasan")
  end

  describe "GET /collection2csv" do
    it "is successful" do
      get "/collection2csv.csv", params: params
      expect(response).to have_http_status(:ok)
    end

    it "returns a csv file" do
      get "/collection2csv.csv", params: params
      expect(response.content_type).to include("text/csv")
      expect(response.header["Content-Disposition"]).to include("attachment")
      expect(response.header["Content-Disposition"]).to include(".csv")
    end

    it "contains proper content" do
      get "/collection2csv.csv", params: params
      csv_content = content_for_plain_collection("User")
      expect(response.body).to eq csv_content
    end
  end
end
