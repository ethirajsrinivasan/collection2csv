require 'spec_helper'
require 'rails_helper'

describe CollectionToCsvHelper,type: :helper do
  before do
    User.create(name: "ethiraj")
    User.create(name: "srinivasan")
  end
  let(:collection) { User.all }
  it "should form url" do
    expect(collection_download(collection)).to eq "<a href=\"/collection2csv.csv?ids%5B%5D=1&amp;ids%5B%5D=2&amp;klass=User\">Download</a>"
  end
  it "should have proper download link text" do
    expect(collection_download(collection,{link_text:"Download CSV"})).to include "Download CSV</a>"
  end
  it "should have proper class name" do
    expect(collection_download(collection)).to include "klass=User"
  end
  it "should return path with csv format" do
    expect(collection_download(collection)).to include "<a href=\"/collection2csv.csv?"
  end
  it "should raise expection when collection is not active record" do
    expect{collection_download([])}.to raise_error(RuntimeError,"[] is not a ActiveRecord collection")
  end
  it "should send column names as params" do
    expect(collection_download(collection,{columns: ["name"]})).to include("column_names","name")
  end
  it "should send association as params" do
    expect(collection_download(collection,{associations: {association_name: ['id','name']}})).to include("associations", "association_name", "id", "name")
  end
end