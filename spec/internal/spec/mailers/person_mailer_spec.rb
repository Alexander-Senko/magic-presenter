# frozen_string_literal: true

RSpec.describe PersonMailer do
	subject { described_class.with person: john }

	let(:john)   { Person.create! first_name: 'John',   last_name: 'Smith' }
	let(:mathew) { Person.create! first_name: 'Mathew', last_name: 'Johnson', parent: john }

	describe 'welcome' do
		subject { super().welcome }

		before { mathew } # should exist

		it { is_expected.to have_attributes subject: 'John Smith joined us' }

		describe 'HTML' do
			include RSpecHtmlMatchers

			subject { super().html_part.body.to_s }

			it { is_expected.to have_tag 'h1',       text: 'John Smith' }
			it { is_expected.to have_tag 'li .name', text: 'Mathew Johnson' }

			describe 'helpers within a view' do
				describe 'instance-level' do
					it { is_expected.to have_tag 'a', href: url_for(mathew), text: 'Mathew Johnson' }
				end

				describe 'class-level' do
					it { is_expected.to have_tag 'nav a', href: people_path, text: 'All' }
				end
			end
		end

		describe 'text' do
			subject { super().text_part.body.to_s }

			it { is_expected.to include 'Welcome John Smith!' }
			it { is_expected.to include '* Mathew Johnson' }

			describe 'helpers within a mailer action' do
				describe 'instance-level' do
					it { is_expected.to include "Details: #{url_for john}" }
				end

				describe 'class-level' do
					it { is_expected.to include "* All: #{people_url}" }
				end
			end
		end
	end
end
