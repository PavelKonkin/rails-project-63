# frozen_string_literal: true

require_relative 'hexlet_code/version'

# Main module for project
module HexletCode
  autoload(:Form, 'hexlet_code/form.rb')
  autoload(:FormStructure, 'hexlet_code/form_structure.rb')

  class Error < StandardError; end

  def self.form_for(user, options = {}, &)
    form_structure = FormStructure.new(user, options, &)
    form = Form.new(form_structure)
    form.body
  end
end
