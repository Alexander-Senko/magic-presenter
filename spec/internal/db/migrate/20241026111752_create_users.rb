# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.2]
	def change
		create_table :users do
			it.string :name

			it.timestamps
		end
	end
end
