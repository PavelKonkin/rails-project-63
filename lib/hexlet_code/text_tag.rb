# frozen_string_literal: true

module HexletCode
  class TextTag
    attr_reader :scheme

    def initialize(user_attr, user_attr_value, options = {})
      @scheme = { tag_type: 'textarea', name: user_attr, cols: 20, rows: 40,
                  value: user_attr_value }.merge options
    end
  end
end
