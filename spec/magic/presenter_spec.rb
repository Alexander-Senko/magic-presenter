# frozen_string_literal: true

module Magic
	RSpec.describe Presenter do
		it 'has a version number' do
			expect(described_class::VERSION).to be_a String
		end
	end
end
