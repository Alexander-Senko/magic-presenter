# frozen_string_literal: true

require 'generators/presenter/presenter_generator'

RSpec.describe PresenterGenerator do
	let(:name)           { self.class.description }
	let(:presenter_name) { Magic::Presenter.name_for name }
	let(:presenter)      { presenter_name.safe_constantize }

	before do
		(presenter_name.deconstantize.presence&.constantize or Object)
				.then
				.select { _1.const_defined? presenter_name.demodulize }
				.map { _1.send :remove_const, presenter_name.demodulize } # rubocop:disable RSpec/RemoveConst

		load file path
	rescue LoadError
		# optional
	end

	shared_context :generated_presenter do
		subject { presenter }

		let(:name) { self.class.parent_groups[-2].description }

		it { is_expected.to have_attributes name: presenter_name }
		it { is_expected.to be < ApplicationPresenter }
	end

	describe 'Person' do
		let(:path) { 'app/presenters/person_presenter.rb' }

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
