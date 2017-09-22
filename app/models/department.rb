class Department < ActiveRecord::Base

	has_one :professional
	has_many :medical_histories

end