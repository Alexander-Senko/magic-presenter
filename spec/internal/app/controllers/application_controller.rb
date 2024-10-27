# frozen_string_literal: true

class ApplicationController < ActionController::Base
	private

	def request
		super or
				ActionDispatch::TestRequest.create
	end
end
