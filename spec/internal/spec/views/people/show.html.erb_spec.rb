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

	describe 'helpers' do
		describe 'instance-level' do
			let(:locals) { { family: [ mathew ] } }

			it { is_expected.to have_tag '.person a', href: url_for(mathew), text: 'Mathew Johnson' }
		end

		describe 'class-level' do
			it { is_expected.to have_tag 'nav a', href: people_path, text: 'All' }
		end
	end
end
