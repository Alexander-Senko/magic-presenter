# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.2]
	def change
		create_table :users do
			_1.string :name

			_1.timestamps
		end
	end
end
