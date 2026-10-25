# frozen_string_literal: true

module Magic
	module Presenter
		# = Collection presenter
		#
		# This presenter is used as a base class to decorate typed
		# collections (e.g., Active Record relations).
		#
		# == Presenter class inference
		#
		# Collection presenters provide automatic class inference for any
		# typed collection based on the class name of its elements powered
		# by Magic Lookup.
		# For example, a collection of `MyRecord`s (e.g., `MyRecord.all`)
		# looks for `MyPresenter::Collection` first.
		# If not found, it looks for collection presenters of its ancestor
		# classes, up to `ObjectPresenter::Collection`.
		class Collection < EnumerableDecorator
			prepend Helpers if defined? ::ActionView

			class << self
				def name_for(...) = Base.name_for(...)
						.concat('::Collection')
			end

			def to_a(...) = self.class.new super
		end
	end
end
