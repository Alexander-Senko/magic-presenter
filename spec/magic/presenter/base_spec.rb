# frozen_string_literal: true

module Magic
	module Presenter
		RSpec.describe Base do
			subject { described_class.new object }

			let(:object) { 2.times.map { rand } }

			describe '.name_for', :method do
				its(['MyObject']) { is_expected.to eq 'MyObjectPresenter' }
				its(['MyModel' ]) { is_expected.to eq 'MyPresenter' }
				its(['MyRecord']) { is_expected.to eq 'MyPresenter' }
			end
		end
	end
end
