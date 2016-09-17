require 'csv'

module ConvertorHelper
  def content_for_plain_collection(klass)
    klass  = klass.constantize
    header = klass.column_names.map(&:camelize)
    collections = klass.all
    CSV.generate do |csv|
      csv << header
      collections.try(:each) {|collection| csv << collection.attributes.values_at(*User.column_names)}
    end
  end
end