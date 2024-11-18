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
					Magic.each_engine { include _1.routes.url_helpers }
				end
			end

			include Behavior
		end
	end
end
