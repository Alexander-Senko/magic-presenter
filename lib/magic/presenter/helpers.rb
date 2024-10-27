# frozen_string_literal: true

module Magic
	module Presenter
		module Helpers # :nodoc:
			extend ActiveSupport::Concern

			# The Magic::Presenter::Helpers::MissingContext exception is
			# raised when no view context to run helpers in has been set.
			class MissingContext < RuntimeError
				def message
					<<~TEXT
						missing view context
						You should set Magic::Presenter.view_context first
					TEXT
				end
			end

			prepended do
				class_attribute :view_context
			end

			class_methods do
				include Helpers

				alias __raise__ raise
			end

			private

			def helpers
				view_context or
						__raise__ MissingContext
			end

			alias_method :h, :helpers

			def method_missing(method, ...)
				super
			rescue NoMethodError
				__raise__ unless view_context
				__raise__ unless helpers.respond_to? method

				helpers.send(method, ...)
			end

			def respond_to_missing?(method, ...)
				super or
						(helpers if view_context).respond_to?(method, ...)
			end
		end
	end
end
