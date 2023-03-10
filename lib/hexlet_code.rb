# frozen_string_literal: true

require_relative "hexlet_code/version"
# Main module for project
module HexletCode
  class Error < StandardError; end

  def build_tag(tag, **args)
    single_tags = %w[br image input]
    double_tags = %w[label div]
    attr = ""
    args.each do |key, value|
      attr = "#{attr} #{key}=\"#{value}\""
    end
    body = (yield if block_given?).to_s
    return "<#{tag}#{attr}>" if single_tags.include? tag

    return "<#{tag}#{attr}>#{body}</#{tag}>" if double_tags.include? tag
  end
end
