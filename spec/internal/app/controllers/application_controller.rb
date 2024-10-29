# frozen_string_literal: true

class ApplicationController < ActionController::Base
	def request
		super or
				ActionDispatch::TestRequest.create
	end
end
