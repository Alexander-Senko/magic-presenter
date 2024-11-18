# frozen_string_literal: true

if defined? Rails::Generators
	# HACK: eliminates the following Thor warning:
	#
	#   Deprecation warning: Expected boolean default value for '--helper'; got :presenter (string).
	Thor::Option.prepend Module.new {
		def validate_default_type!
			return if @name == 'helper'

			super
		end
	}

	Magic.each_engine do |engine|
		engine.config.generators do
			_1.helper = :presenter
		end
	end
end
