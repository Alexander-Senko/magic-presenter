# frozen_string_literal: true

require 'magic/decorator'

require_relative 'presenter/version'
require_relative 'presenter/engine'

module Magic # :nodoc:
	autoload :Presentable, 'magic/presentable'

	# Presentation layer for Rails models
	module Presenter
		autoload :Base,      'magic/presenter/base'
		autoload :GlobalID,  'magic/presenter/global_id'
		autoload :Generator, 'generators/magic/presenter/generator'

		module_function

		def for(...)      = Base.for(...)
		def name_for(...) = Base.name_for(...)
	end

	module_function

	def eager_load *scopes
		return if Rails.application.config.eager_load

		scopes
				.map(&:to_s)
				.map(&:pluralize)
				.map { Rails.root / 'app' / _1 }
				.select(&:exist?)
				.each { Rails.autoloaders.main.eager_load_dir _1 }
	end
end
