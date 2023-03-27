# frozen_string_literal: true

require 'active_support/inflector'

class FormStructure
  include ActiveSupport::Inflector
  attr_reader :scheme

  def initialize(user, options = {}, &)
    @user = user
    @scheme = {}
    @scheme[:form] = { url: '#', method: 'post', class: 'hexlet-form' }.merge options
    @scheme[:tag_list] = []
    yield self if block_given?
  end

  def input(user_attr, options = {})
    tag_options = { as: :input }.merge options
    @scheme[:tag_list] << LabelTag.new(user_attr)
    @scheme[:tag_list] << build_input_type_class(user_attr, @user, tag_options)
  end

  def submit(name = 'Save')
    @scheme[:tag_list] << SubmitTag.new(name)
  end

  private

  def build_input_type_class(user_attr, user, options)
    input_options = options.filter { |key| key != :as }
    "#{options[:as].capitalize}Tag".constantize.new(user_attr, user, input_options)
  end
end

class InputTag
  attr_reader :scheme

  def initialize(user_attr, user, options = {})
    @scheme = { tag_type: 'input', name: user_attr, type: 'text', value: user.public_send(user_attr) }.merge options
  end
end

class TextTag
  attr_reader :scheme

  def initialize(user_attr, user, options = {})
    @scheme = { tag_type: 'textarea', name: user_attr, cols: 20, rows: 40,
                value: user.public_send(user_attr) }.merge options
  end
end

class LabelTag
  attr_reader :scheme

  def initialize(user_attr)
    @scheme = { tag_type: 'label', for: user_attr, value: user_attr.capitalize }
  end
end

class SubmitTag
  attr_reader :scheme

  def initialize(name = 'Save')
    @scheme = { tag_type: 'input', type: 'submit', value: name }
  end
end
