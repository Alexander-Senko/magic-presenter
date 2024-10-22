# frozen_string_literal: true

module Magic
	module Presenter
		RSpec.describe GlobalID do
			let(:decorated) { record.decorate! }
			let(:record)    { Person.create }

			shared_context 'with decorated' do
				let(:object) { decorated }

				it { is_expected.to eq record }
				it { is_expected.to be_decorated }
			end

			shared_context 'with undecorated' do
				let(:object) { record }

				it { is_expected.to     eq record }
				it { is_expected.not_to be_decorated }
			end

			describe 'unsigned' do
				subject { ::GlobalID::Locator.locate object.to_gid }

				it_behaves_like 'with decorated'
				it_behaves_like 'with undecorated'
			end

			describe 'signed' do
				subject { ::GlobalID::Locator.locate_signed object.to_sgid }

				it_behaves_like 'with decorated'
				it_behaves_like 'with undecorated'
			end
		end
	end
end
