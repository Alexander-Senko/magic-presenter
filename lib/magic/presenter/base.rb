# frozen_string_literal: true

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
							.concat('Presenter')
				end

				def model_class = Presentable.for self

				delegate_missing_to :model_class

				private

				# Define collection presenter from the given block.
				#
				#   class MyPresenter < Magic::Presenter::Base
				#     collection_presenter do
				#       def count = "#{super} items"
				#     end
				#   end
				#
				#   class MyModel < ApplicationRecord
				#   end
				#
				#   MyModel.all.count           # =>  42
				#   MyModel.all.decorated.count # => "42 items"
				def collection_presenter(&)
					if const_defined? :Collection, false
						const_get :Collection
					else
						const_set :Collection, Class.new(Collection)
					end.class_eval(&)
				end
			end
		end
	end
end
