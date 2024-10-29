# frozen_string_literal: true

class Person < ApplicationRecord
	belongs_to :parent, class_name: 'Person', inverse_of: :children
	has_many :children, class_name: 'Person', inverse_of: :parent
end
