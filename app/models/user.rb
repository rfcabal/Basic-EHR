class User < ActiveRecord::Base
	require 'digest/md5'

	attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :professional_id
	before_save :encrypt_password
	belongs_to :professional

	def self.search(search)
	  	if search
	    	find(:all, :conditions => ['first_name LIKE ?', "%#{search}%"])
	  	else
	    	find(:all)
	  	end
	end

	validates :first_name,
	:presence => TRUE,
	:length => {
		:minimum => 2,
		:allow_blank => TRUE
	}

	validates :last_name,
	:presence => TRUE,
	:length => {
		:minimum => 2,
		:allow_blank => TRUE
	}

	validates :password,
	:presence => TRUE,
	:length => {
		:minimum => 6,
		:allow_blank => TRUE
	},
	:confirmation => TRUE

	validates :first_name,
	:presence => TRUE

	validates :email,
	:presence => TRUE,
	:uniqueness => TRUE

	def encrypt_password
		self.password = Digest::MD5.hexdigest(password)
	end

	def self.validate_login(email, password)
		user = User.find_by_email(email)

		if user && user.password == Digest::MD5.hexdigest(password)
			user
		else
			nil
		end
	end
end
