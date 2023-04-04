# frozen_string_literal: true

module HexletCode
  autoload(:Tag, 'hexlet_code/tag.rb')
  class Form
    attr_accessor :body

    def initialize(form_structure)
      tag_arr = tag_arr(form_structure)
      @body = tag_arr.join
    end

    private

    def tag_arr(form_structure)
      tag_arr = [form_tag(form_structure)]
      form_structure.scheme[:tag_list].each do |tag|
        tag_arr << "  #{Tag.build(tag.scheme[:tag_type], tag.scheme)}\n"
      end
      tag_arr.append(button_tag(form_structure)) if form_structure.scheme.key? :button
      tag_arr << "</form>\n"
    end

    def form_tag(form_structure)
      form_options = form_options(form_structure)
      "#{Tag.build('form', form_options)}\n"
    end

    def button_tag(form_structure)
      button_scheme = form_structure.scheme[:button].scheme
      "  #{Tag.build('input', { type: 'submit', value: button_scheme[:value] })}\n"
    end

    def form_options(form_structure)
      { action: form_structure.scheme[:form][:url] }.merge form_structure.scheme[:form].except :url
    end
  end
end
