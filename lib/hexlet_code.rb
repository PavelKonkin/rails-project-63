# frozen_string_literal: true

require_relative "hexlet_code/version"
autoload(:Tag, "tag.rb")
autoload(:Form, "form.rb")

# Main module for project
module HexletCode
  class Error < StandardError; end

  def self.form_for(user, options = {}, &)
    form = Form.new(user, options, &)
    form.body
  end
end
