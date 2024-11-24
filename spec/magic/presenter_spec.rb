# frozen_string_literal: true

module Magic
	RSpec.describe Presenter do
		describe '.for' do
			it_behaves_like :delegated,
					to: Presenter::Base, with: Class.new
		end

		describe '.name_for' do
			it_behaves_like :delegated,
					to: Presenter::Base, with: Class.new
		end
	end
end
