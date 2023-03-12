# frozen_string_literal: true

require_relative "hexlet_code/version"
autoload(:Tag, "./lib/tag.rb")

# Main module for project
module HexletCode
  class Error < StandardError; end

  def form_for(_user, url = {})
    action_value = url[:url].nil? ? "#" : url[:url]
    Tag.build("form", action: action_value, method: "post")
  end
end
