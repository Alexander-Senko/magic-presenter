# frozen_string_literal: true

module Magic
	module Presenter
		RSpec.describe Helpers do
			let(:helpers)   { decorated.send :helpers }
			let(:decorated) { person.decorated }
			let(:person)    { Person.create! first_name: 'John', last_name: 'Smith' }

			shared_context 'with explicit helpers' do
				subject { helpers }
			end

			shared_context 'with implicit helpers' do
				subject { decorated }
			end

			context 'with view context' do
				let(:view_context) { ApplicationController.new.view_context }

				around { Magic::Presenter.with view_context:, &_1 }

				shared_examples 'helpers are available' do
					let(:person) { super().decorated } # for the better `#to_s`

					it { expect(subject.link_to person).to eq %'<a href="/people/#{person.id}">#{person}</a>' }
				end

				shared_context 'with helpers enabled' do
					describe 'instance-level' do
						include_examples 'helpers are available'
					end

					describe 'class-level' do
						let(:decorated) { super().class }

						include_examples 'helpers are available'
					end
				end

				it_behaves_like 'with explicit helpers' do
					include_context 'with helpers enabled'
				end

				it_behaves_like 'with implicit helpers' do
					include_context 'with helpers enabled'
				end
			end

			context 'without view context' do
				shared_context 'with helpers disabled' do
					describe 'instance-level' do
						include_examples 'helpers aren’t available'
					end

					describe 'class-level' do
						let(:decorated) { super().class }

						include_examples 'helpers aren’t available'
					end
				end

				it_behaves_like 'with explicit helpers' do
					shared_examples 'helpers aren’t available' do
						it { expect { subject.link_to person }.to raise_error Magic::Presenter::Helpers::MissingContext }
					end

					include_context 'with helpers disabled'
				end

				it_behaves_like 'with implicit helpers' do
					shared_examples 'helpers aren’t available' do
						it { expect { subject.link_to person }.to raise_error NoMethodError }
					end

					include_context 'with helpers disabled'
				end
			end
		end
	end
end
