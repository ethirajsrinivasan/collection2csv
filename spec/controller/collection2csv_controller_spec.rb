require 'spec_helper'
require 'rails_helper'

describe Collection2csvController, type: :controller do
  let(:params) {{klass: "User",ids: [1,2],format: :csv}}
  before do
    User.create(name: "ethiraj")
    User.create(name: "srinivasan")
  end
  describe '#convert' do
    it "should be success" do
      get :convert, params
      expect(response).to be_success
      expect(response.status).to eq 200
    end
    it "should return csv file" do
      get :convert, params
      expect(response.content_type).to eq "text/csv"
      expect(response.header["Content-Disposition"]).to eq "attachment; filename=\"#{params[:klass]}_#{DateTime.now.to_formatted_s(:db)}.csv\""
    end
    it "csv should contain proper content" do
      get :convert, params
      csv_content = content_for_plain_collection("User")
      expect(response.body).to eq csv_content
    end
  end
end