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

	def self.search(search)
	  if search
	    self.where(areaname: "#{search}").take	 
	  end
	end 

	private

	def captlize_name
		self.areaname = areaname.capitalize if areaname.present?
	end            
end
