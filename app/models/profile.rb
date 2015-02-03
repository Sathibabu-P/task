class Profile < ActiveRecord::Base
	attr_accessor :password_confirmation,:uname,:pic
	belongs_to :user
	validates :fname,:dob, length: { minimum: 5 }, :presence =>  true	
	validates :fname, :uniqueness => true	
	validates :phoneno, 
			  :numericality => {:message => "is not a phone number." },
			  :presence =>  true
	validates :password, presence: true
	#validates :password_confirmation, presence: true
	validates :password, length: { in: 5..10 }
	has_attached_file :pic, :styles => 
           { :medium => "300x300>", :thumb => "100x100>" }
    validates_attachment_content_type :pic, :content_type => /^image\/(bmp|gif|jpg|jpeg|png)/

	def self.save(upload,profile)
		#name = profile.id	
	    name =  upload[:upload].original_filename
	    directory = "public/data"
	    # create the file path
	    path = File.join(directory, name)
	    # write the file
	    File.open(path, "wb") { |f| f.write(upload[:upload].read) }
    end

end
