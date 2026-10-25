# frozen_string_literal: true

RSpec.describe 'people/index' do
	subject { rendered }

	let(:john)   { Person.create! first_name: 'John',   last_name: 'Smith'   }
	let(:mathew) { Person.create! first_name: 'Mathew', last_name: 'Johnson', parent: john }
	let(:locals) { {} }

	before do
		[ john, mathew ] # should exist

		assign :people, Person.all

		render locals:
	end

	describe 'helpers' do
		describe 'collection-level' do
			it { is_expected.to have_tag 'nav a', href: person_path(john),   text: 'John Smith' }
			it { is_expected.to have_tag 'nav a', href: person_path(mathew), text: 'Mathew Johnson' }
		end
	end
end
