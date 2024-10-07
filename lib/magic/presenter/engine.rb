# frozen_string_literal: true

module Magic
	module Presenter
		class Engine < ::Rails::Engine # :nodoc:
			isolate_namespace Magic::Presenter
		end
	end
end
