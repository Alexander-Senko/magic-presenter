# frozen_string_literal: true

RSpec.describe 'People' do
	subject { response }

	let(:id)     { person.id }
	let(:person) { Person.create! first_name: 'John', last_name: 'Smith' }

	describe 'GET /show' do
		before { get person_path(id) }

		describe 'error pages' do
			let(:id) { 0 }

			it { is_expected.to have_http_status :not_found }
			it { is_expected.to have_attributes body: /RecordNotFound/ }
		end
	end
end
