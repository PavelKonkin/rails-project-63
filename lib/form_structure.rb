# frozen_string_literal: true

class FormStructure
  attr_reader :scheme

  def initialize(user, options = {}, &)
    @user = user
    @scheme = {}
    @scheme[:form] = { url: '#', method: 'post', class: 'hexlet-form' }.merge options
    @scheme[:tag_list] = []
    yield self if block_given?
  end

  def input(user_attr, options = { as: :default })
    @scheme[:tag_list] << LabelTag.new(user_attr)
    @scheme[:tag_list] << build_input_type_class(user_attr, @user, options)
  end

  def submit(name = 'Save')
    @scheme[:tag_list] << SubmitTag.new(name)
  end

  private

  def build_input_type_class(user_attr, user, options)
    as_option_value = options.delete :as
    case as_option_value
    when :text
      TextAreaTag.new(user_attr, user, options)
    else
      InputTag.new(user_attr, user, options)
    end
  end
end

class InputTag
  attr_reader :scheme

  def initialize(user_attr, user, options = {})
    @scheme = { tag_type: 'input', name: user_attr, type: 'text', value: user.public_send(user_attr) }.merge options
  end
end

class TextAreaTag
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
