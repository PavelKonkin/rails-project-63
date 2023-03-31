# frozen_string_literal: true

module HexletCode
  class SubmitButton
    attr_reader :scheme

    def initialize(name = 'Save')
      @scheme = { type: 'button', value: name }
    end
  end
end
