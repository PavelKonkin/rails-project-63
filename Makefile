install:
	bundle install
lint:
	bundle exec rubocop
test:
	bundle exec rake
.PHONY: test