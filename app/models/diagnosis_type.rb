class DiagnosisType < ActiveRecord::Base

	attr_accessible :id
	has_many :episode_diagnoses 

end
