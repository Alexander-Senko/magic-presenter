# frozen_string_literal: true

Gem::Author ||= Struct.new(
		:name,
		:email,
		:github,
) do
	def github_url = github && "https://github.com/#{github}"
end

module Magic
	module Presenter # :nodoc:
		AUTHORS = [ # rubocop:disable Style/MutableConstant
				Gem::Author.new(
						name:   'Alexander Senko',
						email:  'Alexander.Senko@gmail.com',
						github: 'Alexander-Senko',
				),
		]

		class << AUTHORS
			def names      = filter_map &:name
			def emails     = filter_map &:email
			def github_url = filter_map(&:github_url).first
		end
	end
end
