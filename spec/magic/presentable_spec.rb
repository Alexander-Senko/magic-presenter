# frozen_string_literal: true

module Magic
	RSpec.describe Presentable do
		subject { object }

		let(:object) { 2.times.map { rand } }

		def presenter_class = Class.new Presenter::Base

		before do # HACK: decorators persist across examples somehow otherwise
			stub_const 'Magic::Presenter::Base', Class.new(Presenter::Base)
		end

		before { stub_const 'ArrayDecorator', Class.new(Decorator::Base) }
		after  { Presenter::Base.clear_memery_cache! }

		shared_context :model do
			before { object.extend ActiveModel::Model }
		end

		shared_context 'with a matching presenter' do
			before { stub_const 'ArrayPresenter', presenter_class }
		end

		shared_examples 'returns decorated object' do
			its([]) { is_expected.to eq object }
			its([]) { is_expected.to be_decorated }
		end

		shared_examples 'returns the object decorated by a presenter' do
			include_examples 'returns decorated object'

			its([]) { is_expected.to be_a Presenter::Base }
		end

		shared_examples 'returns the object decorated by a non-presenter' do
			include_examples 'returns decorated object'

			its([]) { is_expected.not_to be_a Presenter::Base }
		end

		describe '#decorate!', :method do
			it_behaves_like :model do
				it { expect { subject[] }.to raise_error Lookup::Error }
				it { expect { subject[] }.to raise_error /no Magic::Presenter found/ }
				it { expect { subject[] }.to raise_error /default name is #{object.class}Presenter/ }

				it_behaves_like 'with a matching presenter' do
					include_examples 'returns the object decorated by a presenter'
				end
			end

			include_examples 'returns the object decorated by a non-presenter'

			it_behaves_like 'with a matching presenter' do
				include_examples 'returns the object decorated by a non-presenter'
			end
		end
	end
end
