# frozen_string_literal: true

source 'https://rubygems.org'

# Specify your gem's dependencies in magic-presenter.gemspec.
gemspec

gem 'puma'

gem 'sqlite3'
gem 'combustion'

group :test do
	gem 'rspec'
	gem 'rspec-its'
	gem 'rspec-rails'
	gem 'rspec-html-matchers'
	gem 'ammeter'

	gem 'simplecov', require: false
end

group :development do
	gem 'rubocop',             require: false
	gem 'rubocop-rails',       require: false
	gem 'rubocop-rspec',       require: false
	gem 'rubocop-rspec_rails', require: false
	gem 'brakeman',            require: false

	gem 'rbs'
end

gem 'magic-decorator', github: 'Alexander-Senko/magic-decorator' # TODO: remove when v0.3 is released
