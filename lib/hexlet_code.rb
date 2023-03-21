# frozen_string_literal: true

require_relative 'hexlet_code/version'
autoload(:Tag, 'tag.rb')
autoload(:Form, 'form.rb')
autoload(:FormStructure, 'form_structure.rb')

# Main module for project
module HexletCode
  class Error < StandardError; end

  def self.form_for(user, options = {}, &)
    form_structure = form_structure(user, options, &)
    form = Form.new(form_structure)
    form.body
  end

  def self.form_structure(user, options = {}, &)
    FormStructure.new(user, options, &)
  end
end
