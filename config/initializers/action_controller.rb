# frozen_string_literal: true

presenter_context = proc do
	around_action :set_presenter_context

	private

	def set_presenter_context(&)
		Magic::Presenter.with view_context:, &
	end
end

ActiveSupport.on_load :action_controller, &presenter_context
