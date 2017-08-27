class Event
	include Mongoid::Document
	include Mongoid::Timestamps

	field :event_date, type: Date
	field :event_name, type: String

	validates_presence_of :event_date, :event_name

	embeds_many :locations, cascade_callbacks: true, validate: true

	def self.future_events
		current_date = Date.today
		Event.where(:event_date => {"$gt" => current_date})
	end

	def self.todays_events
		current_date = Date.today
		Event.where(:event_date => {"$eq" => current_date})
	end

	def self.past_events
		current_date = Date.today
		Event.where(:event_date => {"$lt" => current_date})
	end
end