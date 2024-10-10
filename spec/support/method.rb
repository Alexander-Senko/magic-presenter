# frozen_string_literal: true

RSpec.shared_context :method do
	description.match(/^([.#])(\S+)$/) in symbol, method_name or
			raise ArgumentError, "'#{description}' doesn't look like a method reference"

	subject do
		case [ symbol, super() ]
		in '#', receiver
			receiver
		in '.', Module => receiver
			receiver
		in '.', receiver
			receiver.class
		end&.method method_name
	end
end

shared_context :delegated do |to:, with:|
	before { allow(to).to receive(subject.name).with(*with).and_call_original }

	it do
		subject[*with]

		expect(to).to have_received(subject.name).once
	end
end

RSpec.configure do |config|
	config.include_context :method, :method
end
