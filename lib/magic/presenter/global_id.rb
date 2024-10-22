# frozen_string_literal: true

module Magic
	module Presenter
		# = Active Job integration
		#
		# Active Job [accepts Active Record objects](
		# 	http://edgeguides.rubyonrails.org/active_job_basics.html#globalid
		# ).
		# An object passed to a background job must implement [Global ID](
		# 	https://github.com/rails/globalid
		# ).
		#
		# This module implements Global ID for decorated models by defining
		# `.find` method that uses the one from a model class and decorates
		# the result.
		# This means one can pass decorated objects to background jobs and
		# get them decorated when deserialized.
		module GlobalID
			extend ActiveSupport::Concern

			included do
				include ::GlobalID::Identification
			end

			class_methods do
				def find(...)
					model_class
							.find(...)
							.decorated
				end
			end
		end
	end
end
