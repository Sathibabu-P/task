class Category < ActiveRecord::Base
	has_many :listings
	before_validation :captlize_name, on: [ :create, :update ]
	validates :categoryname, 
			  :presence => true,
			  :uniqueness => true
    validates :position,
   			  :numericality => {:message => "is not a number." }, 
	          :presence => true,	         
	          :uniqueness => {:message => "Position already exists!"}

	private

	def captlize_name
		self.categoryname = categoryname.capitalize if categoryname.present?
	end 
end
