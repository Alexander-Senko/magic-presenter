# frozen_string_literal: true

require 'generators/presenter/presenter_generator'

$LOAD_PATH << Rails.application.root.join('test').to_s

RSpec.describe PresenterGenerator do
	let(:name)           { self.class.description }
	let(:presenter_name) { Magic::Presenter.name_for name }
	let(:presenter)      { presenter_name.safe_constantize }

	before do
		(presenter_name.deconstantize.presence&.constantize or Object)
				.then
				.select { _1.const_defined? presenter_name.demodulize }
				.each   { _1.send :remove_const, presenter_name.demodulize } # rubocop:disable RSpec/RemoveConst

		load file path
	rescue LoadError
		# optional
	end

	shared_context :generated_presenter do
		subject { presenter }

		let(:name) { self.class.parent_groups[-2].description }

		it { is_expected.to have_attributes name: presenter_name }
		it { is_expected.to be < ApplicationPresenter }

		describe 'tests' do
			subject { file path }

			shared_examples 'generates a valid file' do
				it { is_expected.to exist }
				it { is_expected.to have_correct_syntax }
			end

			context 'with TestUnit' do
				let(:options) { { test_framework: :test_unit } }
				let(:path)    { "test/presenters/#{presenter_name.underscore}_test.rb" }

				include_examples 'generates a valid file'

				describe 'generated test' do
					subject { "#{presenter_name}Test".safe_constantize }

					it { is_expected.to be < Magic::Presenter::TestCase }
				end
			end

			context 'with RSpec' do
				let(:options) { { test_framework: :rspec } }

				let :path do
					load file super() # the presenter should be defined before loading the spec

					"spec/presenters/#{presenter_name.underscore}_spec.rb"
				end

				include_examples 'generates a valid file'

				describe 'generated spec' do
					subject { "RSpec::ExampleGroups::#{presenter_name.delete '::'}_3".safe_constantize } # HACK: name heuristics

					it { is_expected.to be < RSpec::Core::ExampleGroup }
					it { is_expected.to be < RSpec::Rails::PresenterExampleGroup }
					it { is_expected.to have_attributes metadata: include(type: :presenter) }
				end
			end
		end
	end

	describe 'Book' do
		let(:path) { 'app/presenters/book_presenter.rb' }

		it_behaves_like :generated_presenter do
			context 'with a parent' do
				let(:options) { { parent: } }
				let(:parent)  { stub_const 'ParentPresenter', Class.new(ApplicationPresenter) }

				it { is_expected.to be < parent }
			end
		end
	end

	describe 'ActiveModel::Model' do
		let(:path) { 'app/presenters/active_model/presenter.rb' }

		it_behaves_like :generated_presenter
	end
end
