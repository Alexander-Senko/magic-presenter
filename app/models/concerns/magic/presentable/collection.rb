# frozen_string_literal: true

module Magic
	module Presentable
		# = Presentable collection
		#
		# This module includes `Magic::Decoratable` and allows a descendant
		# to be decorated by collection presenters only. Presenter class is
		# being inferred automatically from a collection’s model class.
		module Collection
			include Decoratable

			private

			def decorator      = decorator_base.for model_class
			def decorator_base = Presenter::Collection
		end
	end
end
