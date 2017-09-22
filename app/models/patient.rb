class Patient < ActiveRecord::Base

	attr_accessible :lastname, :firstname, :phone, :address, :search
	has_many :episodes
	has_many :episode_diagnoses

	def self.search(search)
	  	if search
	    	find(:all, :conditions => ['firstname LIKE ?', "%#{search}%"])
	  	else
	    	find(:all)
	  	end
	end
end
