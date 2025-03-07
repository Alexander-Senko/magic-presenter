# frozen_string_literal: true

require 'magic/decorator'

require_relative 'presenter/version'
require_relative 'presenter/engine'

module Magic # :nodoc:
	# Presentation layer for Rails models
	module Presenter
		autoload :Base,      'magic/presenter/base'
		autoload :Helpers,   'magic/presenter/helpers'
		autoload :GlobalID,  'magic/presenter/global_id'
		autoload :TestCase,  'magic/presenter/test_case'
		autoload :Generator, 'generators/magic/presenter/generator'

		singleton_class.delegate *%i[
				for name_for
				view_context view_context=
		], to: Base
	end

	module_function # TODO: extract to Magic Support

	def eager_load *scopes, engine: Rails.application
		return if Rails.application.config.eager_load

		scopes
				.map(&:to_s)
				.map(&:pluralize)
				.map { engine.root / 'app' / _1 }
				.select(&:exist?)
				.each { Rails.autoloaders.main.eager_load_dir _1 }
	end

	def each_engine(&)
		Rails.application
				.then { [ _1, *_1.railties ] }
				.grep(Rails::Engine)
				.each(&)
	end
end
