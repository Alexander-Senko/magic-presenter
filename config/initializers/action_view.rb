# frozen_string_literal: true

ActiveSupport.on_load :action_view do
	concerning :DecoratedAssignments, prepend: true do
		def assign(assignments, ...)
			assignments
					.transform_values! &:decorated

			super
		end

		def _run(method, template, locals, ...)
			locals
					.transform_values! &:decorated

			super
		end
	end
end
