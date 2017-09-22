class Professional < ActiveRecord::Base

	attr_accessible :id, :nid
	has_one :user
	has_many :medical_histories
	belongs_to :professional_type
	belongs_to :professional_specialty
	belongs_to :department

end