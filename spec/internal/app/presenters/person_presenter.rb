# frozen_string_literal: true

class PersonPresenter < ApplicationPresenter
	def name = "#{first_name} #{last_name}"
end
