# frozen_string_literal: true

require "csv"

module ConvertorHelper
  def content_for_plain_collection(klass)
    klass = klass.constantize
    header = klass.column_names.map(&:camelize)
    collections = klass.all
    CSV.generate do |csv|
      csv << header
      collections.each { |collection| csv << collection.attributes.values_at(*klass.column_names) }
    end
  end
end
