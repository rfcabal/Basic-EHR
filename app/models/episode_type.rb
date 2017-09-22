class EpisodeType < ActiveRecord::Base

	attr_accessible :id, :name
	has_one :episode

end
