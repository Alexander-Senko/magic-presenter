# frozen_string_literal: true

module Magic
	RSpec.describe Presenter do
		describe '.for', :method do
			it_behaves_like :delegated,
					to: Presenter::Base, with: Array
		end

		describe '.name_for', :method do
			it_behaves_like :delegated,
					to: Presenter::Base, with: Array
		end
	end
end
