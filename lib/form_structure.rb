# frozen_string_literal: true

# Class for creating form structure
class FormStructure
  attr_reader :scheme

  def initialize(user, options = {}, &)
    @user = user
    @scheme = {}
    @scheme[:form] = { url: '#', method: 'post', class: 'hexlet-form' }.merge options
    @scheme[:tag_list] = []
    yield self if block_given?
  end

  def input(user_attr, options = {})
    @scheme[:tag_list] << LabelTag.new(user_attr)
    case options[:as]
    when nil
      @scheme[:tag_list] << InputTag.new(user_attr, @user, options)
    when :text
      options.delete :as
      @scheme[:tag_list] << TextAreaTag.new(user_attr, @user, options)
    end
  end

  def submit(name = 'Save')
    @scheme[:tag_list] << SubmitTag.new(name)
  end
end

# Class for input tag scheme
class InputTag
  attr_reader :scheme

  def initialize(user_attr, user, options = {})
    @scheme = { tag_type: 'input', name: user_attr, type: 'text', value: user.public_send(user_attr) }.merge options
  end
end

# Class for input tag textarea
class TextAreaTag
  attr_reader :scheme

  def initialize(user_attr, user, options = {})
    @scheme = { tag_type: 'textarea', name: user_attr, cols: 20, rows: 40,
                value: user.public_send(user_attr) }.merge options
  end
end

# Class for input tag label
class LabelTag
  attr_reader :scheme

  def initialize(user_attr)
    @scheme = { tag_type: 'label', for: user_attr, value: user_attr.capitalize }
  end
end

# Class for input tag submit
class SubmitTag
  attr_reader :scheme

  def initialize(name = 'Save')
    @scheme = { tag_type: 'input', type: 'submit', value: name }
  end
end
