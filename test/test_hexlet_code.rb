# frozen_string_literal: true

require "test_helper"

# Class for tests
class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)
  def setup
    @form_tag = File.read("./test/fixture_should_return_form")
    @form_tag_with_added_attributes = File.read("./test/fixture_should_return_form_with_added_attributes")
    @form_tag_with_address = File.read("./test/fixture_should_return_form_with_address")
    @form_tag_with_custom_input = File.read("./test/fixture_should_return_form_with_custom_input")
    @form_tag_with_overrided_defaults = File.read("./test/fixture_should_return_form_with_overrided_defaults")
    @form_with_cust_named_submit_button = File.read("./test/fixture_should_return_form_with_cust_named_submit_button")
    @user = User.new(name: "rob", job: "hexlet", gender: "male")
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_should_return_tag
    assert { HexletCode.form_for "user" == "<form action=\"#\" method=\"post\"></form>" }
  end

  def test_should_return_tag_with_address
    assert { HexletCode.form_for "user", url: "/users" == "<form action=\"/users\" method=\"post\"></form>" }
  end

  def test_should_return_tag_whith_default_action
    assert { HexletCode.form_for "user" == "<form action=\"#\" method=\"post\"></form>" }
  end

  def test_should_return_form
    res = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job
      f.submit
    end
    assert { res == @form_tag }
  end

  def test_should_return_form_with_added_attributes
    res = HexletCode.form_for @user do |f|
      f.input :name, class: "user-input"
      f.input :job
      f.submit
    end
    assert { res == @form_tag_with_added_attributes }
  end

  def test_should_return_form_with_address
    res = HexletCode.form_for(@user, url: "/users") do |f|
      f.input :name
      f.input :job
      f.submit
    end
    assert { res == @form_tag_with_address }
  end

  def test_should_return_form_with_custom_input
    res = HexletCode.form_for @user do |f|
      f.input :job, as: :text
      f.submit
    end
    assert { res == @form_tag_with_custom_input }
  end

  def test_should_return_form_with_overrided_defaults
    res = HexletCode.form_for @user do |f|
      f.input :job, as: :text, rows: 50, cols: 50
      f.submit
    end
    assert { res == @form_tag_with_overrided_defaults }
  end

  def test_should_raise_error
    assert_raises HexletCode.form_for @user do |f|
      f.input :age
      f.submit
    end
  end

  def test_should_return_form_with_custom_named_submit_button
    res = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job
      f.submit "Send"
    end
    assert { res == @form_with_cust_named_submit_button }
  end
end
