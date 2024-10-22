# frozen_string_literal: true

require 'generators/magic/presenter/install/install_generator'

module Magic
	module Presenter
		RSpec.describe InstallGenerator do
			subject { file path }

			describe 'ApplicationPresenter' do
				let(:path) { 'app/presenters/application_presenter.rb' }

				it { is_expected.to have_correct_syntax }

				it 'generates ApplicationPresenter' do
					Object.send :remove_const, :ApplicationPresenter # rubocop:disable RSpec/RemoveConst
					load subject

					expect(ApplicationPresenter).to be < Base
				end
			end
		end
	end
end
