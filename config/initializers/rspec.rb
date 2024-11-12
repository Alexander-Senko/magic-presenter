# frozen_string_literal: true

RSpec.configure do |config|
	config.include concern(:PresenterExampleGroup) {
		included { metadata[:type] = :presenter }
	}, file_path: %r'spec/presenters', type: :presenter
end if defined? RSpec::Core
