# frozen_string_literal: true

require_relative "hexlet_code/version"
autoload(:Tag, "tag.rb")
autoload(:Form, "form.rb")

# Main module for project
module HexletCode
  class Error < StandardError; end

  def self.form_for(user, url = {})
    form = Form.new
    form.user = user
    action_value = url[:url].nil? ? "#" : url[:url]
    form.body = "#{Tag.build("form", action: action_value, method: "post")}\n"
    yield form if block_given?
    form.body << "</form>\n"
    form.body
  end
end
