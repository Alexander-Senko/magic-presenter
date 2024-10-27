# frozen_string_literal: true

ActiveSupport.on_load :action_view do
	concerning :DecoratedAssignments, prepend: true do
		def assign(assignments, ...)
			decorate assignments

			super
		end

		def _run(method, template, locals, ...)
			decorate locals

			super
		end

		private

		def decorate objects
			objects
					.transform_values!(&:decorated)
		end
	end
end
