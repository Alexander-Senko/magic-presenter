# frozen_string_literal: true

require 'magic/decorator'

require_relative 'presenter/version'
require_relative 'presenter/engine'

module Magic
	autoload :Presentable, 'magic/presentable'

	# Presentation layer for Rails models
	module Presenter
		autoload :Base, 'magic/presenter/base'

		module_function

		def for(...)      = Base.for(...)
		def name_for(...) = Base.name_for(...)
	end
end
