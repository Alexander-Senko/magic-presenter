# frozen_string_literal: true

Rails.application.config.to_prepare do
	[ Rails.root / 'app/presenters' ]
			.select(&:exist?)
			.each { Rails.autoloaders.main.eager_load_dir _1 }
end unless Rails.application.config.eager_load
