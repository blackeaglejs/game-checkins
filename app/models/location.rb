class Location
	include Mongoid::Document
	include Mongoid::Timestamps

	embedded_in :game_watch

	field :address_1, type: String
	field :address_2, type: String, default: ""
	field :city, type: String
	field :state, type: String
	field :zip, type: String

	validates_presence_of :address_1, :city, :state, :zip

	validates :zip, 
		format: {
			:with => /\A\d{5}(-\d{4})?\z/,
			:message => "should be in the form: 12345 or 12345-1234"
		}

	def complete_location
		city.present? ? city_delim = city + "," : city_delim = city
		[address_1, address_2, city_delim, state, zip].reject(&:nil? || empty?).join(' ')
	end
end