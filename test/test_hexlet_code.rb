# frozen_string_literal: true

require "test_helper"

# Class for tests
class TestHexletCode < Minitest::Test
  include HexletCode
  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def setup
    @form_tag = File.read("./test/fixture_should_return_form")
    @form_tag_with_added_attributes = File.read("./test/fixture_should_return_form_with_added_attributes")
    @form_tag_with_address = File.read("./test/fixture_should_return_form_with_address")
    @form_tag_with_custom_input = File.read("./test/fixture_should_return_form_with_custom_input")
    @form_tag_with_overrided_defaults = File.read("./test/fixture_should_return_form_with_overrided_defaults")
    @user = User.new(name: "rob", job: "hexlet", gender: "male")
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_should_return_tag
    assert { form_for "user" == "<form action=\"#\" method=\"post\"></form>" }
  end

  def test_should_return_tag_with_address
    assert { form_for "user", url: "/users" == "<form action=\"/users\" method=\"post\"></form>" }
  end

  def test_should_return_tag_whith_default_action
    assert { form_for "user" == "<form action=\"#\" method=\"post\"></form>" }
  end

  def test_should_return_form
    res = form_for @user do |f|
      f.input :name
      f.input :job
    end
    assert { res == @form_tag }
  end

  def test_should_return_form_with_added_attributes
    res = form_for @user do |f|
      f.input :name, class: "user-input"
      f.input :job
    end
    assert { res == @form_tag_with_added_attributes }
  end

  def test_should_return_form_with_address
    res = form_for(@user, url: "/users") do |f|
      f.input :name
      f.input :job
    end
    assert { res == @form_tag_with_address }
  end

  def test_should_return_form_with_custom_input
    res = form_for @user do |f|
      f.input :job, as: :text
    end
    assert { res == @form_tag_with_custom_input }
  end

  def test_should_return_form_with_overrided_defaults
    res = form_for @user do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end
    assert { res == @form_tag_with_overrided_defaults }
  end

  def test_should_raise_error
    assert_raises form_for @user do |f|
      f.input :age
    end
  end
end
