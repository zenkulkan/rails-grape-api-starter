# frozen_string_literal: true

module Helpers
  module SerializationHelper
    def serialized_to_json(object, options = {})
      class_name = object.is_a?(ActiveRecord::Relation) ? object.class.to_s.split('::').first : object.class.name
      serializer_class = "#{class_name}Serializer".constantize

      serializer_class.new(object, options)
    rescue NameError
      error!('Serializer not found', 422)
    end
  end
end
