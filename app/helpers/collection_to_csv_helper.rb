module CollectionToCsvHelper
	def collection_download(collection,column_names={})
    p column_names    
		collection_ids = collection.map(&:id)
		klass =  collection.first.class
		link_to "Download" , collection2csv_path(ids: collection_ids,klass: klass,format: "csv",column_names: column_names)
	end
end
