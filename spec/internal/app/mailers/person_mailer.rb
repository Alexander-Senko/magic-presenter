# frozen_string_literal: true

class PersonMailer < ApplicationMailer
	def welcome
		@person = params[:person].decorated
		@family = @person.children
		@url    = @person.url
		@urls   = @person.class.urls

		mail subject: "#{@person.name} joined us"
	end
end
