class Area < ActiveRecord::Base
	has_many :listings, dependent: :destroy
	before_validation :captlize_name, on: [ :create, :update ]
	validates :areaname, 
			  :presence => true,
			  :uniqueness => true
    validates :position,
   			  :numericality => {:message => "is not a number." }, 
	          :presence => true,	         
	          :uniqueness => {:message => "Position already exists!"}

	private

	def captlize_name
		self.areaname = areaname.capitalize if areaname.present?
	end            
end
