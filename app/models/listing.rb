class Listing < ActiveRecord::Base
	attr_accessor :hidden_area_id,:hidden_category_id
	belongs_to :area
	belongs_to :category
	before_validation :captlize_name, on: [ :create, :update ]
	before_validation :set_area,:set_category	
	validates :listingname, 
			  :presence => true
	validates :price, 
			  :presence => true,
			  :numericality => true		  			  
    validates :area_id, 
	          :presence => {:message => "Please Select any one option!" }
	
	def self.search(search)
	  if search
	  	@area = search
	   self.where("area_id like ?", "#{@area.id}")
	  else
	    self.all
	  end
	end 

	# def self.search(search)
		
	#   if search
	#   	@area = Area.where("areaname like ?", "%#{search}%")	  
	#   else
	#     self.all
	#   end
	# end 



	private

	def captlize_name
		self.listingname = listingname.capitalize if listingname.present?
	end
	def set_area
		self.area_id = self.hidden_area_id if self.hidden_area_id.present?
	end
	def set_category
		self.category_id = self.hidden_category_id if self.hidden_category_id.present?
	end
end
