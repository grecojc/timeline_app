class TrendsController < ApplicationController
	def index
		@trends = Trend.where("created_at >= ? and created_at < ?", DateTime.in_time_zone("EST").to_date.prev_day, DateTime.in_time_zone("EST").to_date)
		@date = Date.today.prev_day.strftime('%a' ' ' '%B' ' ' '%d' ' ' '%Y')
	end
end
