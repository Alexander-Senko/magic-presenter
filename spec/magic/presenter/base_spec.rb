# frozen_string_literal: true

module Magic
	module Presenter
		RSpec.describe Base do
			subject { described_class.new object }

			let(:object) { 2.times.map { rand } }

			describe '.name_for' do
				its_result('MyObject') { is_expected.to eq 'MyObjectPresenter' }
				its_result('MyModel')  { is_expected.to eq 'MyPresenter' }
				its_result('MyRecord') { is_expected.to eq 'MyPresenter' }
			end

			describe '.model_class' do
				context 'when presenting the only model' do
					subject { Presenter.for Person }

					its_result { is_expected.to eq Person }
				end

				context 'when presenting multiple models' do
					subject { Presenter.for ApplicationRecord }

					it { expect { subject[] }.to raise_error Lookup::Error }
					it { expect { subject[] }.to raise_error "multiple model classes found for #{receiver}" }
				end

				context 'when presenting no models' do
					subject { stub_const 'AbstractPresenter', Class.new(ApplicationPresenter) }

					it { expect { subject[] }.to raise_error Lookup::Error }
					it { expect { subject[] }.to raise_error "no model class found for #{receiver}" }
				end
			end
		end
	end
end
