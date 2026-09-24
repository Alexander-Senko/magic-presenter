# frozen_string_literal: true

module Magic
	# This module includes `Magic::Decoratable` and allows a descendant
	# to be decorated by presenters only. Presenter class is being
	# inferred automatically.
	module Presentable
		include Decoratable
		include Lookup::Scope[:model]

		private

		def decorator_base = Presenter::Base
	end
end
