# frozen_string_literal: true

# Load the Rails application
require 'combustion'

# Initialize the Rails application
Combustion.initialize! *%i[
		active_record
		action_controller
		active_job
], **{
		database_reset: false,
		load_schema:    false,
}
