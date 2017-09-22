class Episode < ActiveRecord::Base

	attr_accessible :id, :patient_id
	belongs_to :patient
	belongs_to :episode_type
	has_many :medical_histories
	has_many :episode_diagnoses, through: :medical_histories


	def self.search(search)
	  	if search
	    	find(:all, :conditions => ['id LIKE ?', "%#{search}%"])
	  	else
	    	find(:all)
	  	end
	end

end
