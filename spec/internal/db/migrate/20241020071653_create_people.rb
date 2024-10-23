# frozen_string_literal: true

class CreatePeople < ActiveRecord::Migration[7.2]
	def change
		create_table :people do
			_1.belongs_to :parent, foreign_key: { to_table: _1.name }

			_1.string :first_name
			_1.string :last_name

			_1.timestamps
		end
	end
end
