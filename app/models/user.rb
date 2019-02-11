class User < ApplicationRecord
	attr_accessor :password
	before_save :encrypt_password
	after_save :clear_password

	validates :username, :presence =>true, :uniqueness => true, :length => {:in =>4..16}
	validates :password, :confirmation => true
	validates :password, :length =>{:in=>8..32}, :on => :create

	attr_accessor :username, :email, :password, :password_confirmation
	
	def encrypt_password
		unless password.blank?
			self.salt = Digest::RMD160.hexdigest("#{email}, #{Time.now}")
			self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
		end
	end

	def clear_password
		self.password = nil
	end

	def self.authenticate(username="", login_password="")
		user = User.find_by_username(username)
		if user && user.match_password(login_password)
			return user
		else
			return false
		end
	end

	def match_password(login_password="")
		encrypted_password ==BCrypt::Engine.hash_secret(login_password, salt)
	end
end
