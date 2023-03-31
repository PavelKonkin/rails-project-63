# frozen_string_literal: true

module HexletCode
  class InputTag
    attr_reader :scheme

    def initialize(user_attr, user_attr_value, options = {})
      @scheme = { tag_type: 'input', name: user_attr, type: 'text', value: user_attr_value }.merge options
    end
  end
end
