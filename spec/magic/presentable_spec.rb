# frozen_string_literal: true

module Magic
	RSpec.describe Presentable do
		subject { object }

		let(:object) { 2.times.map { rand } }

		def presenter_class = Class.new Presenter::Base

		before { GC.start } # purge removed classes
		after  { Presenter::Base.clear_memery_cache! }

		shared_context :model do
			metadata[:retry] = 9 # FIXME

			before { object.singleton_class.include ActiveModel::Model }
		end

		shared_context 'with a matching presenter' do
			before { stub_const 'ArrayPresenter', presenter_class }
		end

		shared_examples 'returns decorated object' do
			its_result { is_expected.to eq object }
			its_result { is_expected.to be_decorated }
		end

		shared_examples 'returns the object decorated by a presenter' do
			include_examples 'returns decorated object'

			its_result { is_expected.to be_a Presenter::Base }
		end

		shared_examples 'returns the object decorated by a non-presenter' do
			include_examples 'returns decorated object'

			its_result { is_expected.not_to be_a Presenter::Base }
		end

		shared_examples 'fails to find a presenter' do
			it { expect { subject[] }.to raise_error Lookup::Error }
			it { expect { subject[] }.to raise_error /no Magic::Presenter found/ }
			it { expect { subject[] }.to raise_error /default name is #{object.class}Presenter/ }
		end

		describe '#decorate!' do
			it_behaves_like :model do
				include_examples 'fails to find a presenter'

				it_behaves_like 'with a matching presenter' do
					include_examples 'returns the object decorated by a presenter'
				end
			end

			include_examples 'returns the object decorated by a non-presenter'

			it_behaves_like 'with a matching presenter' do
				include_examples 'returns the object decorated by a non-presenter'
			end

			context 'with Active Record' do
				let(:object) { model_class.new }

				context 'when the class has an explicit presenter' do
					let(:model_class) { Person }

					include_examples 'returns the object decorated by a presenter'
				end

				context 'with ApplicationPresenter' do
					let(:model_class) { User }

					include_examples 'returns the object decorated by a presenter'
				end

				context 'without presenters defined' do
					let(:model_class) { SchemaMigration }

					include_examples 'fails to find a presenter'
				end
			end
		end
	end
end
