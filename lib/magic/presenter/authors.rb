# frozen_string_literal: true

begin
	require 'rubygems/author'
rescue LoadError # HACK: install magic-support
	`gem install magic-support --no-lock --ignore-dependencies --no-document`
			.match(/^Successfully installed (?<full_name>.*)$/)
			&.match(:full_name)
			&.then { Bundler.bundle_path.join 'gems', _1, 'lib' }
			&.then { $LOAD_PATH << _1 }

	require 'rubygems/author' # retry
end

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
