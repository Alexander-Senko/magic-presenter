# frozen_string_literal: true

RSpec.shared_context :generator do
	require 'ammeter/init'

	destination Rails.root / 'tmp/generated'

	let(:arguments) { [ *try(:name), *options.map { |k, v| "--#{k.to_s.dasherize}=#{v}" } ] }
	let(:options)   { {} }

	before do
		prepare_destination
		run_generator arguments
	end
end

RSpec.configure do |config|
	config.include_context :generator, type: :generator
end
