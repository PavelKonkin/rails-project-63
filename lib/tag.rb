# frozen_string_literal: true

#  Module for tag generation
module Tag
  def self.build(tag, args = {})
    single_tags = %w[br image input form]
    double_tags = %w[label div textarea]
    attr = ""
    args.each do |key, value|
      attr = "#{attr} #{key}=\"#{value}\"" unless key.eql? :as
    end
    body = (yield if block_given?).to_s
    return "<#{tag}#{attr}>" if single_tags.include? tag

    return "<#{tag}#{attr}>#{body}</#{tag}>" if double_tags.include? tag
  end
end
