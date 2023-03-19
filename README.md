### Hexlet tests and linter status:
[![Actions Status](https://github.com/PavelKonkin/rails-project-63/workflows/hexlet-check/badge.svg)](https://github.com/PavelKonkin/rails-project-63/actions)

### CI status
[![CI Status](https://github.com/PavelKonkin/rails-project-63/workflows/main/badge.svg)](https://github.com/PavelKonkin/rails-project-63/actions)

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
  f.submit
end
```
result:
```htm
<form action="#" method="post">
  <label for="name">Name</label>
  <input name="name" type="text" value="rob">
  <label for="job">Job</label>
  <input name="job" type="text" value="hexlet">
  <input type="submit" value="Save">
</form>
```

User attribute can be complemented with additional options as hash
```ruby
HexletCode.form_for user, url: '#' do |f|
  f.input :name, class: 'user-input'
  f.input :job
  f.submit
end
```
result:
```htm
<form action="#" method="post">
  <label for="name">Name</label>
  <input name="name" type="text" value="rob" class="user-input">
  <label for="job">Job</label>
  <input name="job" type="text" value="hexlet">
  <input type="submit" value="Save">
</form>
```

Type of tag for user attribute can be altered with as: option
```ruby
HexletCode.form_for user do |f|
  f.input :job, as: :text
  f.submit
end
```
result:
```htm
<form action="#" method="post">
  <label for="job">Job</label>
  <textarea name="job" cols="20" rows="40">hexlet</textarea>
  <input type="submit" value="Save">
</form>
```

The default values could be altered
```ruby
HexletCode.form_for user, url: '#' do |f|
  f.input :job, as: :text, rows: 50, cols: 50
  f.submit
end
```
result:
```htm
<form action="#" method="post">
  <label for="job">Job</label>
  <textarea name="job" cols="50" rows="50">hexlet</textarea>
  <input type="submit" value="Save">
</form>
```