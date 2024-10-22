# frozen_string_literal: true

module Magic
	module Presenter
		module Generator # :nodoc:
			private

			def file_name name = super()
				name
						.camelize
						.then { Magic::Presenter.name_for _1 }
						.underscore
			end

			def file_path path = super(), root: target_root
				root / 'presenters' / path
			end
		end
	end
end
