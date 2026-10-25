# frozen_string_literal: true

module Magic
	module Presenter
		RSpec.describe Collection do
			subject { described_class.new collection }

			let(:collection) { [ object ] }
			let(:object)     { 2.times.map { rand } }

			describe '.name_for' do
				its_result('MyObject') { is_expected.to eq 'MyObjectPresenter::Collection' }
				its_result('MyModel')  { is_expected.to eq 'MyPresenter::Collection' }
				its_result('MyRecord') { is_expected.to eq 'MyPresenter::Collection' }
			end

			describe '#to_a' do
				its_result { is_expected.to be_decorated }
				its_result { is_expected.to be_a described_class }
				its_result { is_expected.to all be_decorated }
			end
		end
	end
end
