# frozen_string_literal: true

require 'magic/core_ext/kernel/optional'

module Magic
	module Presenter
		class Engine < ::Rails::Engine # :nodoc:
			isolate_namespace Magic::Presenter

			config.generators do
				_1.test_framework = :rspec
			end
		end
	end
end
