# frozen_string_literal: true

require 'rails/generators/test_unit'
require 'generators/magic/presenter/generator'

module TestUnit # :nodoc:
	module Generators # :nodoc:
		class PresenterGenerator < Base # :nodoc:
			include Magic::Presenter::Generator

			source_root File.expand_path('templates', __dir__)

			check_class_collision suffix: 'PresenterTest'

			cattr_reader :target_root, default: Pathname('test')

			def create_test_file
				template 'presenter_test.rb', "#{file_path}_test.rb"
			end
		end
	end
end
