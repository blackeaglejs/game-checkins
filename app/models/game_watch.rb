class GameWatch < Event

	SPORTS = %W(baseball basketball cross_country fencing football golf lacrosse soccer swimming tennis track_and_field wrestling
				field_hockey rowing softball volleyball)

	field :opponent, type: String
	field :sport, type: String
	field :raffle_money_raised, type: Money

	validates_presence_of :opponent, :sport

	embeds_many :locations, cascade_callbacks: true, validate: true

	has_and_belongs_to_many :attendees

	def self.current_season_watches
		if Date.today.month < 7
			year_start_date = DateTime.new((Date.today.year)-1,7,1)
			year_end_date = DateTime.new(Date.today.year,6,30).end_of_day
			GameWatch.where("watch_date" => {"$gte" => year_start_date, "$lte" => year_end_date})
		elsif Date.today.month >= 7
			year_start_date = DateTime.new(Date.today.year,7,1)
			year_end_date = DateTime.new((Date.today.year)+1,6,30).end_of_day
			GameWatch.where("watch_date" => {"$gte" => year_start_date, "$lte" => year_end_date})
		end
	end
end