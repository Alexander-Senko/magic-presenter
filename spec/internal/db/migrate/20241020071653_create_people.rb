# frozen_string_literal: true

class CreatePeople < ActiveRecord::Migration[7.2]
	def change
		create_table :people do
			it.belongs_to :parent, foreign_key: { to_table: it.name }

			it.string :first_name
			it.string :last_name

			it.timestamps
		end
	end
end
