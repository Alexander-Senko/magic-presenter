# frozen_string_literal: true

module Magic
	module Presentable
		# = Presentable Active Record relation
		#
		# A tiny wrapper around `Presentable::Collection` for Active Record
		# relations.
		module ActiveRecordCollection
			include Collection

			def model_class = model
		end
	end
end
