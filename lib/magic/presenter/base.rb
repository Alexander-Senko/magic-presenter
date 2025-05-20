# frozen_string_literal: true

require 'delegate'

module Magic
	module Presenter
		# = Magic Presenter
		#
		# Any presenter should inherit `Magic::Presenter::Base`.
		# It further inherits from `SimpleDelegator` and behaves like that.
		#
		# == Presenter class inference
		#
		# Presenters provide automatic class inference for any model based
		# on its class name powered by Magic Lookup.
		# For example, `MyModel.new` looks for `MyPresenter` first.
		# If not found, it looks for presenters of its ancestor classes,
		# up to `ObjectPresenter`.
		class Base < Decorator::Base
			include GlobalID if defined? ::GlobalID
			prepend Helpers  if defined? ::ActionView

			class << self
				def name_for object_class
					object_class
							.to_s
							.delete_suffix('Model')
							.delete_suffix('Record')
							.then { "#{_1}Presenter" }
				end

				def model_class
					Presentable.classes
							.select { self.for(_1) == self }
							.sole
				rescue Enumerable::SoleItemExpectedError => error
					raise Lookup::Error, "#{error.message
							.sub('items', 'model classes')
							.sub('item',  'model class')
					} for #{self}"
				end

				delegate_missing_to :model_class

				def descendants
					Magic.eager_load :presenters

					super
				end
			end
		end
	end
end
