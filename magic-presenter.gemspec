# frozen_string_literal: true

require_relative 'lib/magic/presenter/version'
require_relative 'lib/magic/presenter/authors'

Gem::Specification.new do |spec|
	spec.name        = 'magic-presenter'
	spec.version     = Magic::Presenter::VERSION
	spec.authors     = Magic::Presenter::AUTHORS.names
	spec.email       = Magic::Presenter::AUTHORS.emails
	spec.homepage    = "#{Magic::Presenter::AUTHORS.github_url}/#{spec.name}"
	spec.summary     = 'Presentation layer for Rails models'
	spec.description = 'Based on Magic Decorator, it’s meant to replace Draper.'
	spec.license     = 'MIT'

	spec.metadata['homepage_uri']    = spec.homepage
	spec.metadata['source_code_uri'] = spec.homepage
	spec.metadata['changelog_uri']   = "#{spec.metadata['source_code_uri']}/blob/v#{spec.version}/CHANGELOG.md"

	spec.files = Dir.chdir(File.expand_path(__dir__)) do
		Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
	end

	spec.required_ruby_version = '~> 3.2'

	spec.add_dependency 'rails', '>= 7.2', '< 9'
	spec.add_dependency 'magic-decorator', '~> 1.0'
	spec.add_dependency 'magic-lookup'
	spec.add_dependency 'magic-support'
end
