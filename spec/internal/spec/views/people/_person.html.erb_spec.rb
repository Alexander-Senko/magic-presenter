# frozen_string_literal: true

RSpec.describe 'people/_person' do
	subject { rendered }

	let(:person) { Person.create! first_name: 'John', last_name: 'Smith'   }

	shared_examples 'renders name' do
		it { is_expected.to have_tag '.name', text: 'John Smith' }
	end

	describe 'implicit' do
		before { render person }

		include_examples 'renders name'
	end

	describe 'explicit' do
		before { render 'people/person', person: }

		include_examples 'renders name'
	end
end
