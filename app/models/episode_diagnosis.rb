class EpisodeDiagnosis < ActiveRecord::Base

	attr_accessible :id
	belongs_to :episode
	belongs_to :medical_history
	belongs_to :patient
	belongs_to :diagnosis
	belongs_to :diagnosis_type


end
