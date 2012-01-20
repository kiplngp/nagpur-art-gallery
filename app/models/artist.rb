class Artist < ActiveRecord::Base
  
  # Validations
  validates_presence_of :name, :artist_info
  validates_uniqueness_of :name
  validates_length_of :name, :within => 2..100
  validates_length_of :artist_info, :within => 5..50000
  
  has_many :artist_photos
  
  
  # Attached file are Stored on Amazon S3
  has_attached_file :photo, 
                    :styles => { :thumb => "85x75" },
                    :storage => :s3, :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                    :path => "public/attachments/artists/:id/:style/:basename.:extension",
                    :convert_options => {
                          :thumb => "-background '#C7CCD2' -compose Copy -gravity center -extent 85x75"
                      }
                   
  
  
  
 end
