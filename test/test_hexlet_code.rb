# frozen_string_literal: true

require "test_helper"

# Class for tests
class TestHexletCode < Minitest::Test
  include HexletCode
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_return_tag
    assert { form_for("user") == "<form action=\"#\" method=\"post\"></form>" }
  end

  def test_it_does_something_useful
    assert { 5.class.instance_of? [].class }
  end
end
