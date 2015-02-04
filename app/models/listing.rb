class Listing < ActiveRecord::Base
	attr_accessor :hidden_area_id
	belongs_to :area
	belongs_to :category
	before_validation :captlize_name, on: [ :create, :update ]
	before_validation :set_area	
	validates :listingname, 
			  :presence => true
	validates :price, 
			  :presence => true,
			  :numericality => true		  			  
    validates :area_id, 
	          :presence => {:message => "Please Select any one option!" }
	         
	private

	def captlize_name
		self.listingname = listingname.capitalize if listingname.present?
	end
	def set_area
		self.area_id = self.hidden_area_id if self.hidden_area_id.present?
	end
end
