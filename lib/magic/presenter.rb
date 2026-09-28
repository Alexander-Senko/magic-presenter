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

	def each_engine(&)
		Rails.application
				.then { [ it, *it.railties ] }
				.grep(Rails::Engine)
				.each(&)
	end
end
