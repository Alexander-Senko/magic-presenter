# frozen_string_literal: true

require 'rubygems/author'

module Magic
	module Presenter
		class Author < Gem::Author # :nodoc:
			new(
					name:   'Alexander Senko',
					email:  'Alexander.Senko@gmail.com',
					github: 'Alexander-Senko',
			)
		end
	end
end
