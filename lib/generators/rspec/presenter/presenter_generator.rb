# frozen_string_literal: true

require 'generators/rspec'
require 'generators/magic/presenter/generator'

module Rspec # :nodoc:
	module Generators # :nodoc:
		class PresenterGenerator < Base # :nodoc:
			include Magic::Presenter::Generator

			source_root File.expand_path('templates', __dir__)

			cattr_reader :target_root, default: Pathname('spec')

			def create_test_file
				template 'presenter_spec.rb', "#{file_path}_spec.rb"
			end
		end
	end
end
