# frozen_string_literal: true

if defined? RSpec::Core
	RSpec.configure do |config|
		if defined? RSpec::Rails
			require 'rspec/rails/example/presenter_example_group'

			config.include RSpec::Rails::PresenterExampleGroup, type: :presenter
		end

		# Tag all groups and examples in the spec/presenters directory with
		# type: :presenter
		config.define_derived_metadata file_path: %r'/spec/presenters/' do |metadata|
			metadata[:type] ||= :presenter
		end
	end
end
