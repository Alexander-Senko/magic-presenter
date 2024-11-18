# frozen_string_literal: true

RSpec.configure do |config|
	config.include concern(:PresenterExampleGroup) {
		included do
			metadata[:type] = :presenter

			include RSpec::Rails::HelperExampleGroup

			Rails.application
					.then { [ _1, *_1.railties ] }
					.grep(Rails::Engine)
					.each { include _1.routes.url_helpers }

			around { Magic::Presenter.with view_context: self, &_1 }
		end
	}, file_path: %r'spec/presenters', type: :presenter
end if defined? RSpec::Core
