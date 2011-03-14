class ArtistPhoto < ActiveRecord::Base
  acts_as_urlnameable :title
    		def to_param
  		 	urlname
    		end
   
  
  validates_presence_of :code, :title
  validates_length_of :code, :within => 2..25
  validates_length_of :title, :within => 2..100
   
  has_attached_file :photo, 
                    :styles => { :original => "", :slider =>"", :medium => "", :thumb => "" },
                    :storage => :s3, :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                    :path => ":rails_root/public/attachments/galleries/:gallery_id/gallery_photos/:id/:style/:basename.:extension",
                    :convert_options => {
                      :original => "",
                      :slider =>"-gravity center -thumbnail 305x300^ -extent 496x330",
                      :medium => "-gravity center -thumbnail 305x300^ -extent 255x250",
                      :thumb => "-gravity center -thumbnail 85x75^ -extent 85x75"
                      }
   validates_attachment_presence :photo
   validates_attachment_size :photo, :less_than => 5000000                   
      
end
