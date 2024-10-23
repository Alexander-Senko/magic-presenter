# frozen_string_literal: true

class Person < ApplicationRecord
	belongs_to :parent, class_name: 'Person'
end
