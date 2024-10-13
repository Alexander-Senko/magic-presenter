# frozen_string_literal: true

RSpec.shared_context :method do
	description.match(/(?:^|\s)([.#])(\S+)(?:$|\s)/) in symbol, method_name or
			raise ArgumentError, "'#{description}' doesn't look like a method reference"

	subject_method = instance_method :subject

	while subject_method.owner.then { not _1.respond_to? :metadata or _1.metadata[:method] }
		subject_method = subject_method.super_method or break
	end

	define_method :subject do
		receiver =
				case [ symbol, subject_method&.bind_call(self) || super() ]
				in '#', receiver
					receiver
				in '.', Module => receiver
					receiver
				in '.', receiver
					receiver.class
				end

		receiver.method method_name
	rescue NameError
		-> *args { receiver.send method_name, *args }
	end

	let(:method_name) { method_name.to_sym }

	def self.subject &block
		prepend Module.new {
			define_method(:subject) { super().unbind.bind instance_eval &block }
		}
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
