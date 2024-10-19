# frozen_string_literal: true

ActiveSupport.on_load :active_model do
	include Magic::Presentable
end
