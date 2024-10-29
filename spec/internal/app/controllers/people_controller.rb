# frozen_string_literal: true

class PeopleController < ApplicationController
	def show
		@person = Person.find(params[:id])
				.decorated

		if request.head?
			headers['X-Name']   = @person.name
			headers['Location'] = @person.url

			head :ok
		end
	end
end
