module CollectionToCsvHelper
  def collection_download(collection,options={})
    column_names = options[:columns].presence
    associations = options[:associations].presence
    link_text = options[:link_text].presence || 'Download'
    klass =  collection.try(:first).class
    raise "#{collection} is not a ActiveRecord collection" unless klass.ancestors.include?(ActiveRecord::Base)
    collection_ids = collection.map(&:id)
    link_to link_text , collection2csv_path(ids: collection_ids,klass: klass,format: "csv",column_names: column_names,associations: associations)
  end
end
