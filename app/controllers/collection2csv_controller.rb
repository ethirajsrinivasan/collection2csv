require 'csv'
require 'collection2csv/convertor'
class Collection2csvController < ApplicationController

  def convert
    send_data Collection2csv::Convertor.new(params).perform, filename: "#{params[:klass]}_#{DateTime.now.to_formatted_s(:db)}.csv"
  end

end