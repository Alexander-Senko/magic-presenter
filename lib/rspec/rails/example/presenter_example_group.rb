# frozen_string_literal: true

require 'rspec/rails'

module RSpec
	module Rails
		# @api public
		# Container module for presenter specs.
		module PresenterExampleGroup
			extend  ActiveSupport::Concern
			include HelperExampleGroup
			include Magic::Presenter::TestCase::Behavior

			included do
				around { Magic::Presenter.with view_context: self, &it }
			end
		end
	end
end
