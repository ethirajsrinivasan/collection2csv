require 'csv'
class Collection2csvController < ApplicationController
  def convert
    klass =  params[:klass].constantize
    if params[:column_names].present?
      column_names = params[:column_names].split(',').to_a
    else
      column_names = klass.column_names
    end
    collection = klass.find(params[:ids])
    respond_to do |format|
      format.csv { send_data to_csv(collection,column_names)  ,:filename => "#{klass}_#{DateTime.now.to_formatted_s(:db)}.csv"
		 }
    end
  end

  private

  def to_csv(collection,column_names)
    CSV.generate do |csv|
      csv << column_names.map(&:humanize)
      collection.each do |product|
	csv << product.attributes.values_at(*column_names)
      end
    end
  end
end
