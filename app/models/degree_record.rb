class DegreeRecord
	include Mongoid::Document
	include Mongoid::Timestamps

	embedded_in :chapter_member

	DEGREE_KINDS = ["BA", "BS", "MA", "MS", "PhD", "JD", "MD", "MBA"]

	field :graduation_year, type: String
	field :degree_kind, type: String
	field :major, type: String

	validates_presence_of :graduation_year

	validates :degree_kind
		inclusion: { in: DEGREE_KINDS },
		allow_blank: true

end