require 'csv'
module Collection2csv
  class Convertor
    def initialize(params)
      @klass =  params[:klass].constantize
      @column_names_from_params = params[:column_names].presence
      @associations_from_params = params[:associations].presence
      @column_names =  @column_names_from_params || @klass.column_names
      @associations =  @associations_from_params || {}
      @association_class_names = {}
      @association_column_names = []
      @primary_ids = params[:ids]
    end

    def perform
      validate
      download
    end

    private

    def validate
      validate_columns if @column_names_from_params.present?
      validate_associations if @associations_from_params.present?
    end

    def download
      @collections = @klass.includes(@associations.try(:keys)).find(@primary_ids)
      to_csv(@collections,@column_names,@associations)
    end

    def validate_columns
      false_columns = @column_names - @klass.column_names
      raise_error(false_columns,'column',@klass.name) unless false_columns.empty?
    end

    def raise_error(false_entities, pluralizer, source = nil)
      msg = construct_error_msg(false_entities, pluralizer)
      msg << ' in ' if source.present?
      raise msg + source
    end

    def construct_error_msg(false_entities,pluralizer)
      false_entities.join(', ') + ' ' + pluralizer.pluralize(false_entities.count) + ' not found'
    end

    def validate_associations
      unless @associations.empty?
        get_association_class_names
        validate_association_column_names
      end
    end

    def validate_association_keys
      non_associative_keys = @associations.keys - @klass.reflections.keys
      raise_error(non_associative_keys,'association') unless non_associative_keys.empty?
    end

    def get_association_class_names
      @klass.reflect_on_all_associations.each  do |association|
        @association_class_names["#{association.name}"] = association.options[:class_name].presence || association.name.to_s.camelize
      end
    end

    def get_filename
      "#{@klass}_#{DateTime.now.to_formatted_s(:db)}.csv"
    end

    def validate_association_column_names
      @associations.each do |association_key , association_value|
        false_columns = association_value - @association_class_names[association_key].constantize.column_names
        raise_error(false_columns,'column',association_key) unless false_columns.empty?
      end
    end

    def generate_header
      @header = @column_names.map(&:camelize)
      @header += association_column_names
    end

    def association_column_names
      @associations.each do | association_key, association_value |
        association_value.each { |column_name| @association_column_names << "#{association_key}_#{column_name}" }
      end
      @association_column_names.map(&:camelize)
    end

    def generate_column_data(collection)
      data = collection.attributes.values_at(*@column_names)
      data = @associations.empty? ?  data : generate_column_data_for_association(collection, data)
    end

    def generate_column_data_for_association(collection, data)
      @associations.each do  |association_key , association_value |
        obj = collection.public_send(association_key)
        data += obj.present? ? obj.attributes.values_at(*association_value) : Array.new(association_value.count,"")
      end
      data
    end

    def to_csv(collections,column_names,associations)
      CSV.generate do |csv|
        csv << generate_header
        @collections.each { |collection| csv << generate_column_data(collection) }
      end
    end
  end
end
