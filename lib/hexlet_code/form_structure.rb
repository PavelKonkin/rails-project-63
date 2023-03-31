# frozen_string_literal: true

require 'active_support/inflector'

module HexletCode
  autoload(:LabelTag, 'hexlet_code/label_tag.rb')
  autoload(:InputTag, 'hexlet_code/input_tag.rb')
  autoload(:TextTag, 'hexlet_code/text_tag.rb')
  autoload(:SubmitButton, 'hexlet_code/submit_button.rb')
  class FormStructure
    include ActiveSupport::Inflector
    attr_reader :scheme

    def initialize(user, options = {})
      @user = user
      @scheme = { form: {}, tag_list: [] }
      @scheme[:form] = { url: '#', method: 'post', class: 'hexlet-form' }.merge options
      yield self if block_given?
    end

    def input(user_attr, options = {})
      tag_options = { as: :input }.merge options
      @scheme[:tag_list] << LabelTag.new(user_attr)
      user_attr_value = @user.public_send(user_attr)
      @scheme[:tag_list] << build_input_type_class(user_attr, user_attr_value, tag_options)
    end

    def submit(name = 'Save')
      @scheme[:button] = SubmitButton.new(name)
    end

    private

    def build_input_type_class(user_attr, user_attr_value, options)
      input_options = options.except :as
      "HexletCode::#{options[:as].capitalize}Tag".constantize.new(user_attr, user_attr_value, input_options)
    end
  end
end
