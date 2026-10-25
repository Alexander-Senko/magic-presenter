# frozen_string_literal: true

Rails.application.config.to_prepare do
	ActiveModel::API.include Magic::Presentable
end

ActiveSupport.on_load :active_record do
	ActiveRecord::Relation.include Magic::Presentable::Collection
	ActiveRecord::Relation.include Module.new { def model_class = model }
end
