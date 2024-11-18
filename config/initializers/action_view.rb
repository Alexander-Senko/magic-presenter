# frozen_string_literal: true

ActiveSupport.on_load :action_view do # rubocop:disable Metrics/BlockLength
	concerning :DecoratedAssignments, prepend: true do
		def assign assignments
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

	concerning :PresenterContext, prepend: true do
		def in_rendering_context(...)
			Magic::Presenter.with view_context: self do
				super
			end
		end

		private

		def decorate(...)
			super
					.each_value
					.grep(Magic::Presenter::Base)
					.each { _1.view_context = self }
		end
	end
end
