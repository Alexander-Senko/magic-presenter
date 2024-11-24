# frozen_string_literal: true

begin
	require lib = 'rubygems/author'
rescue LoadError => error # HACK: install magic-support
	raise unless error.path == lib

	`gem install #{name = 'magic-support'} --ignore-dependencies --no-document`
			.match(/^Successfully installed (?<full_name>#{name}-.*)$/)
			&.match(:full_name)
			&.then { Bundler.bundle_path.join 'gems', _1, 'lib' }
			&.then { $LOAD_PATH << _1 }

	require error.path # retry
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
