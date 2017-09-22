class Diagnosis < ActiveRecord::Base

	attr_accessible :id, :name
	has_many :episode_diagnoses
	
end
