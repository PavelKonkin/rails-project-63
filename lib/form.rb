# frozen_string_literal: true

autoload(:Tag, 'tag.rb')
class Form
  attr_accessor :body

  def initialize(form_structure)
    @body = ''
    form_options = { action: form_structure.scheme[:form].delete(:url) }
    form_options.merge! form_structure.scheme[:form]
    @body = "#{Tag.build('form', form_options)}\n"
    form_structure.scheme[:tag_list].each do |tag|
      @body << "  #{Tag.build(tag.scheme[:tag_type], tag.scheme)}\n"
    end
    @body << "</form>\n"
  end
end
