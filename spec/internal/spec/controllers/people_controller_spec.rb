# frozen_string_literal: true

RSpec.describe PeopleController do
	subject { response }

	let(:id)     { person.id }
	let(:person) { Person.create! first_name: 'John', last_name: 'Smith' }

	describe 'HEAD /show' do
		subject { response.headers }

		before { head :show, params: { id: } }

		it { is_expected.to include 'x-name'   => 'John Smith' }
		it { is_expected.to include 'location' => person_path(person) }
	end

	describe 'GET /show' do
		before { get :show, params: { id: } }

		it { is_expected.to have_http_status :ok }
	end
end
