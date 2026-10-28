# frozen_string_literal: true

class ApplicationController < ActionController::Base
	def request
		super or
				ActionDispatch::TestRequest.create
	end

	helper_method def current_user = session[:user]
end
