class ArtistPhoto < ActiveRecord::Base
  acts_as_urlnameable :title
    		def to_param
  		 	urlname
    		end
   
  
  validates_presence_of :code, :title
  validates_length_of :code, :within => 2..25
  validates_length_of :title, :within => 2..100
   
  # Attached file are Stored on Amazon S3
  has_attached_file :photo, 
                    :styles => { :original => "860x550", :slider =>"480x330", :medium => "270x250", :thumb => "85x75" },
                     :storage => :s3, :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                    :path => "public/attachments/artist-photos/:id/:style/:basename.:extension",
                    :convert_options => {
                      :original => "-background '#C7CCD2' -compose Copy -gravity center -extent 860x550",
                      :slider =>"-background '#C7CCD2' -compose Copy -gravity center -extent 480x330",
                      :medium => "-background '#C7CCD2' -compose Copy -gravity center -extent 270x250",
                      :thumb => "-background '#C7CCD2' -compose Copy -gravity center -extent 85x75"
                      }
   validates_attachment_presence :photo
   validates_attachment_size :photo, :less_than => 5000000                   
      
end
