class ProfessionalType < ActiveRecord::Base

	attr_accessible :id
	has_one :professional
	

end