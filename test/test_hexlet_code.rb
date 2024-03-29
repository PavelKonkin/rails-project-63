# frozen_string_literal: true

require 'test_helper'

# Class for tests
class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)
  def setup
    @user = User.new(name: 'rob', job: 'hexlet', gender: 'male')
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_should_return_tag_with_address
    result = HexletCode.form_for @user, url: '/users'
    assert { result == get_fixture(name) }
  end

  def test_should_return_tag_whith_default_action
    result = HexletCode.form_for @user
    assert { result == get_fixture(name) }
  end

  def test_should_return_form
    result = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job
      f.submit
    end
    assert { result == get_fixture(name) }
  end

  def test_should_return_form_with_added_attributes
    result = HexletCode.form_for @user do |f|
      f.input :name, class: 'user-input'
      f.input :job
      f.submit
    end
    assert { result == get_fixture(name) }
  end

  def test_should_return_form_with_address
    result = HexletCode.form_for(@user, url: '/users') do |f|
      f.input :name
      f.input :job
      f.submit
    end
    assert { result == get_fixture(name) }
  end

  def test_should_return_form_with_custom_input
    result = HexletCode.form_for @user do |f|
      f.input :job, as: :text
      f.submit
    end
    assert { result == get_fixture(name) }
  end

  def test_should_return_form_with_overrided_defaults
    result = HexletCode.form_for @user do |f|
      f.input :job, as: :text, rows: 50, cols: 50
      f.submit
    end
    assert { result == get_fixture(name) }
  end

  def test_should_raise_error
    assert_raises HexletCode.form_for @user do |f|
      f.input :age
      f.submit
    end
  end

  def test_should_return_form_with_cust_named_submit_button
    result = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job
      f.submit 'Send'
    end
    assert { result == get_fixture(name) }
  end

  def get_fixture(test_name)
    fixture_name = test_name.sub('test_', 'fixture_')
    File.read("test/fixtures/#{fixture_name}.html")
  end
end
