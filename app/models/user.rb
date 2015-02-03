class User < ActiveRecord::Base
	has_one :profile, dependent: :destroy
	before_validation :captlize_name, on: [ :create, :update ]
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :username, 
			  :presence => true,
			  :uniqueness => true
    validates :email, 
	          :presence => {:message => "Enter your email address!" },
	          :format => { :with => VALID_EMAIL_REGEX, :message => "Enter a valid Email address !"},
	          :uniqueness => {:case_sensitive => false, :message => "Email already exists!"}
	private

	def captlize_name
		self.username = username.capitalize if username.present?
	end          
end
