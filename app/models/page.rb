class Page < ActiveRecord::Base
  acts_as_urlnameable :title
    		def to_param
  		 	urlname
    		end

 # validation    		
  validates_presence_of :title, :body
  validates_uniqueness_of :title
  validates_length_of :title, :within => 2..100
  validates_length_of :body, :minimum => 10
  validates_length_of :keyword, :within => 3..200, :allow_blank => true
  
 # Attached file are Stored on Amazon S3
  has_attached_file :photo, 
                    :styles => { :thumb => "230x178" },
                    :storage => :s3, :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                    :path => "public/attachments/pages/:id/:style/:basename.:extension",
                    :convert_options => {
                          :thumb => "-background '#C7CCD2' -compose Copy -gravity center -extent 230x178"
                      }
  
   
end
