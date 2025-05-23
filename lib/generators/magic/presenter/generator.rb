# frozen_string_literal: true

module Magic
	module Presenter
		module Generator # :nodoc:
			require 'generators/rails/presenter/presenter_generator'

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

			def presenter_path(*) = file_path(*, root: Rails::PresenterGenerator.target_root)
		end
	end
end
