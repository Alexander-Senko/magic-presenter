# frozen_string_literal: true

module Magic
	module Presenter
		class Engine < ::Rails::Engine
			isolate_namespace Magic::Presenter

			config.generators do
				it.test_framework = :rspec
			end
		end
	end
end
