# frozen_string_literal: true

module HexletCode
  autoload(:Tag, 'hexlet_code/tag.rb')
  class Form
    attr_accessor :body

    def initialize(form_structure)
      tag_arr = get_tag_arr(form_structure)
      @body = tag_arr.join
    end

    private

    def get_tag_arr(form_structure)
      tag_arr = [get_form_tag(form_structure)]
      form_structure.scheme[:tag_list].each do |tag|
        tag_arr << "  #{Tag.build(tag.scheme[:tag_type], tag.scheme)}\n"
      end
      tag_arr.append(get_button_tag(form_structure)) if form_structure.scheme.key? :button
      tag_arr << "</form>\n"
    end

    def get_form_tag(form_structure)
      form_options = { action: form_structure.scheme[:form][:url] }
      form_options.merge! form_structure.scheme[:form].except :url
      "#{Tag.build('form', form_options)}\n"
    end

    def get_button_tag(form_structure)
      button_scheme = form_structure.scheme[:button].scheme
      "  #{Tag.build('input', { type: 'submit', value: button_scheme[:value] })}\n"
    end
  end
end
