class Artist < ActiveRecord::Base
  
  
  validates_presence_of :name, :artist_info
  validates_uniqueness_of :name
  validates_length_of :name, :within => 2..100
  validates_length_of :artist_info, :within => 5..10000
  
  
  has_attached_file :photo, 
                    :styles => { :thumb => "" },
                     :storage => :s3, :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                    :path => "public/attachments/artists/:id/:style/:basename.:extension",
                    :convert_options => {
                          :thumb => "-gravity center -thumbnail 85x75^ -extent 85x75"
                      }
                   
  
  has_many :artist_photos
  
 end
