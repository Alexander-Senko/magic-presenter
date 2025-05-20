# frozen_string_literal: true

class AgentPresenter < ApplicationPresenter
	def self.for object_class
		return AgentPresenter if object_class.in? [
				Organization,
				Bot,
		]

		super
	end
end
