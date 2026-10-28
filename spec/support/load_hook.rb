# frozen_string_literal: true

RSpec.shared_context 'with load hook' do |hook_name|
	let(:path) { Magic.const_source_location(described_class.name).first }

	before do
		allow(ActiveSupport).to receive(:run_load_hooks)
				.and_call_original

		silence_warnings { load path }
	end

	it "triggers the `#{hook_name}` load hook" do
		expect(ActiveSupport).to have_received(:run_load_hooks)
				.with hook_name, described_class
	end
end
