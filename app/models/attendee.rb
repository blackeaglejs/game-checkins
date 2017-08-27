class Attendee
	include Mongoid::Document
	include Mongoid::Timestamps

	belongs_to :chapter_member

	field :raffle_ticket_count, type: Integer

	delegate :first_name, to: :chapter_member, allow_nil: true
	delegate :last_name, to: :chapter_member, allow_nil: true
	delegate :full_name, to: :chapter_member, allow_nil: true
	delegate :university_relationship, to: :chapter_member, allow_nil: true

	has_and_belongs_to_many :game_watches

end