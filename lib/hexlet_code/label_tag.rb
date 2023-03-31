# frozen_string_literal: true

module HexletCode
  class LabelTag
    attr_reader :scheme

    def initialize(user_attr)
      @scheme = { tag_type: 'label', for: user_attr, value: user_attr.capitalize }
    end
  end
end
