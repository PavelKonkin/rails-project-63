# frozen_string_literal: true

module HexletCode
  #  Module for tag generation
  module Tag
    def self.build(tag, args = {})
      hash_for_attributes = args.except :tag_type
      if build_single_tag? tag
        attributes = compose_attributes_string(hash_for_attributes)
        "<#{tag}#{attributes}>"
      else
        hash_for_attributes = hash_for_attributes.except :value
        attributes = compose_attributes_string(hash_for_attributes)
        body = args[:value]
        "<#{tag}#{attributes}>#{body}</#{tag}>"
      end
    end

    def self.compose_attributes_string(hash_for_attributes)
      attributes = ''
      hash_for_attributes.each do |key, value|
        attributes = "#{attributes} #{key}=\"#{value}\""
      end
      attributes
    end

    def self.build_single_tag?(tag)
      %w[br image input form].include? tag
    end
  end
end
