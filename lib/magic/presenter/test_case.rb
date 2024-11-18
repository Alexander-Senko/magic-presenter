# frozen_string_literal: true

require 'action_view/test_case'

module Magic
	module Presenter
		# = Magic Presenter test case
		#
		class TestCase < ActiveSupport::TestCase
			module Behavior # :nodoc:
				extend ActiveSupport::Concern

				include ActionView::TestCase::Behavior

				included do
					Rails.application
							.then { [ _1, *_1.railties ] }
							.grep(Rails::Engine)
							.each { include _1.routes.url_helpers }
				end
			end

			include Behavior
		end
	end
end
