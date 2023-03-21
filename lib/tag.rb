# frozen_string_literal: true

#  Module for tag generation
module Tag
  def self.build(tag, args = {})
    build_single_tag = %w[br image input form].include? tag
    build_double_tag = %w[label div textarea].include? tag
    attr = ''
    args.each do |key, value|
      attr = "#{attr} #{key}=\"#{value}\"" unless (key.eql? :tag_type) || ((key.eql? :value) && build_double_tag)
    end
    body = args[:value]
    return "<#{tag}#{attr}>" if build_single_tag

    return "<#{tag}#{attr}>#{body}</#{tag}>" if build_double_tag
  end
end
