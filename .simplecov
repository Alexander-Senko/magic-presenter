# frozen_string_literal: true

SimpleCov.module_eval do
	enable_coverage :branch
	enable_coverage :eval

	skip '/spec/'
end
