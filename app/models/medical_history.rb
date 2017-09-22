class MedicalHistory < ActiveRecord::Base

	attr_accessible :id

	belongs_to :episode
	belongs_to :professional
	belongs_to :department
	has_one :episode_diagnosis


end