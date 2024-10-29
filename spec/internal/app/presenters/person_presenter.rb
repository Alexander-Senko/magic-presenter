# frozen_string_literal: true

class PersonPresenter < ApplicationPresenter
	class << self
		def links
			[
					link_to('All', model_class),
			]
		end
	end

	def name = "#{first_name} #{last_name}"

	def link(...) = link_to(name, self, ...)

	def to_s = name
end
