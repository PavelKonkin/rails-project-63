### Hexlet tests and linter status:
[![Actions Status](https://github.com/PavelKonkin/rails-project-63/workflows/hexlet-check/badge.svg)](https://github.com/PavelKonkin/rails-project-63/actions)

### Travis CI status
[![Build Status](https://app.travis-ci.com/PavelKonkin/rails-project-63.svg?branch=main)](https://app.travis-ci.com/PavelKonkin/rails-project-63)

### Usage

First you need to make new user, for whom the form will be generated.

```ruby
User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new name: 'rob', job: 'hexlet', gender: 'm'
```

HexletCode.form_for method accept user and block. In block call form input method with name of user attribute that need to be placed in form as tag.

```ruby
HexletCode.form_for user do |f|
  f.input :name
  f.input :job
end
```
result:
# <form action="#" method="post">
  <input name="name" type="text" value="rob">
  <input name="job" type="text" value="hexlet">
</form>

User attribute can be complemented with additional options as hash
```ruby
HexletCode.form_for user, url: '#' do |f|
  f.input :name, class: 'user-input'
  f.input :job
end
```
result:
# <form action="#" method="post">
  <input name="name" type="text" value="rob" class="user-input">
  <input name="job" type="text" value="hexlet">
</form>

Type of tag for user attribute can be altered with as: option
```ruby
HexletCode.form_for user do |f|
  f.input :job, as: :text
end
```
result:
# <form action="#" method="post">
  <textarea name="job" cols="20" rows="40">hexlet</textarea>
</form>

The default values could be altered
```ruby
HexletCode.form_for user, url: '#' do |f|
  f.input :job, as: :text, rows: 50, cols: 50
end
```
result:
# <form action="#" method="post">
  <textarea name="job" cols="50" rows="50">hexlet</textarea>
</form>