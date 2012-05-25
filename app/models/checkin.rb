class Checkin < ActiveRecord::Base
	validates :restaurant_id,	:presence => true
	validates :device_reg,		:presence => true
end
