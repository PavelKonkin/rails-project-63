# frozen_string_literal: true

autoload(:Tag, "./lib/tag.rb")
# Class for creating form object
class Form
  attr_accessor :body, :user

  def initialize
    @body = ""
    @user = ""
  end

  def input(user_attr, **args)
    case args[:as]
    when nil
      tag_hash = prepare_input user_attr, args
    when :text
      tag_hash = prepare_textarea user_attr, args
    end
    @body << "  #{Tag.build("label", for: tag_hash[:args][:name]) { tag_hash[:args][:name].capitalize }}\n"
    @body << "  #{Tag.build(tag_hash[:type], tag_hash[:args]) { tag_hash[:block] }}\n"
  end

  def prepare_input(user_attr, args)
    tag_type = "input"
    tag_args = { name: user_attr, type: "text", value: @user.public_send(user_attr) }.merge args
    block = ""
    { type: tag_type, args: tag_args, block: }
  end

  def prepare_textarea(user_attr, args)
    args.delete :as
    tag_type = "textarea"
    tag_args = { name: user_attr, cols: 20, rows: 40 }.merge args
    block = @user.public_send(user_attr)
    { type: tag_type, args: tag_args, block: }
  end

  def submit(button_name = "Save")
    @body << "  #{Tag.build("input", type: "submit", value: button_name)}\n"
  end
end
