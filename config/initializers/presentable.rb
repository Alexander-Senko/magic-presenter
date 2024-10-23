# frozen_string_literal: true

Rails.application.config.to_prepare do
	ActiveModel::API.include Magic::Presentable
end
