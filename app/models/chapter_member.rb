class ChapterMember
	include Mongoid::Document
	include Mongoid::Timestamps

	RELATIONSHIP_KINDS = %w(alumni family_member other)

	field :first_name, type: String
	field :last_name, type: String
	field :full_name, type: String
	field :university_relationship, type: String
	field :board_member, type: Boolean, default: false

	validates_presence_of :first_name, :last_name, :university_relationship, :board_member

	validates :university_relationship,
		inclusion: { in: RELATIONSHIP_KINDS },
		allow_blank: false

	before_save :update_full_name

	embeds_many :degree_records, cascade_callbacks: true, validate: true

	has_one :attendee

	def full_name
		@full_name = [first_name, last_name].join(" ")
	end

	def update_full_name
		full_name
	end

end