# frozen_string_literal: true

require "rails_helper"

RSpec.describe CollectionToCsvHelper, type: :helper do
  before do
    User.create!(name: "ethiraj")
    User.create!(name: "srinivasan")
  end

  let(:collection) { User.all }

  it "forms url" do
    expect(collection_download(collection)).to eq(
      '<a href="/collection2csv?ids%5B%5D=1&amp;ids%5B%5D=2&amp;klass=User">Download</a>'
    )
  end

  it "has proper download link text" do
    expect(collection_download(collection, link_text: "Download CSV")).to include "Download CSV</a>"
  end

  it "has proper class name" do
    expect(collection_download(collection)).to include "klass=User"
  end

  it "returns path with csv format" do
    expect(collection_download(collection)).to include '<a href="/collection2csv?'
  end

  it "raises an exception when collection is not active record" do
    expect { collection_download([]) }.to raise_error(RuntimeError, "[] is not a ActiveRecord collection")
  end

  it "sends column names as params" do
    expect(collection_download(collection, columns: ["name"])).to include("column_names", "name")
  end

  it "sends association as params" do
    expect(collection_download(collection, associations: { association_name: %w[id name] }))
      .to include("associations", "association_name", "id", "name")
  end
end
