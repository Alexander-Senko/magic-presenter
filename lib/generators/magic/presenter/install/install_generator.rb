# frozen_string_literal: true

module Magic
	module Presenter
		class InstallGenerator < Rails::Generators::Base # :nodoc:
			include Generator

			source_root File.expand_path('templates', __dir__)

			def create_files
				template 'application_presenter.rb', "#{presenter_path namespaced_file_name 'ApplicationRecord'}.rb"
			end

			private

			def namespaced_file_name(*)
				File.join *(namespaced_path if namespaced?), file_name(*)
			end
		end
	end
end
