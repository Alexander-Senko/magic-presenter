# frozen_string_literal: true

class PersonPresenter < AgentPresenter
	class << self
		def links
			[
					link_to('All', model_class),
			]
		end

		def urls
			{
					all: url_for(model_class),
			}
		end
	end

	def name = "#{first_name} #{last_name}"

	def url = url_for self

	def link(...) = link_to(name, self, ...)

	def to_s = name
end
