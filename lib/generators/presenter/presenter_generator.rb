# frozen_string_literal: true

class PresenterGenerator < Rails::Generators::NamedBase # :nodoc:
	include Magic::Presenter::Generator

	source_root File.expand_path('templates', __dir__)

	check_class_collision suffix: 'Presenter'

	class_option :parent,
			type:    :string,
			default: 'ApplicationPresenter',
			desc:    'The parent class for the generated presenter'

	cattr_reader :target_root, default: Pathname('app')

	def create_presenter_file
		template 'presenter.rb', "#{file_path}.rb"
	end

	hook_for :test_framework

	private

	def parent_class_name = options[:parent].classify
end
