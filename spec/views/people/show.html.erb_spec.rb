# frozen_string_literal: true

RSpec.describe 'people/show' do
	subject { rendered }

	let(:john)   { Person.create! first_name: 'John',   last_name: 'Smith'   }
	let(:mathew) { Person.create! first_name: 'Mathew', last_name: 'Johnson', parent: john }
	let(:locals) { {} }

	before do
		assign :person, john

		render locals:
	end

	describe 'assigned variables' do
		it { is_expected.to have_tag 'h1', text: 'John Smith' }
	end

	describe 'locals' do
		let(:locals) { { family: [ mathew ] } }

		it { is_expected.to have_tag '.family .person .name', text: 'Mathew Johnson' }
	end
end
