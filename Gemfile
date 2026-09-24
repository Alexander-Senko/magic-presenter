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
	gem 'rspec-retry'
	gem 'rspec-rails'
	gem 'rspec-html-matchers'
	gem 'magic-support'
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

# CI-specific

case rails_version = ENV.fetch('RAILS_VERSION', :default)
when 'head'
	gem 'rails', github: 'rails/rails'
when /\d+(\.\d+)?/
	gem 'rails', "~> #{rails_version}.0"
end
