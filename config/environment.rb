RAILS_GEM_VERSION = '2.3.9' unless defined? RAILS_GEM_VERSION
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  require 'yaml'
  
  config.time_zone = 'UTC'
  config.i18n.default_locale = :en
  config.active_record.partial_updates = true
  
  config.gem 'mislav-will_paginate', :version => '~> 2.2.3', :lib => 'will_paginate', :source => 'http://gems.github.com'
  
#  YAML.load_file("#{Rails.root}/config/s3.yml")[Rails.env]["bucket"]
  config.middleware.use "NoWWW" if RAILS_ENV == 'development'
  
 # CONFIG = (YAML.load_file('config/config.yml')[RAILS_ENV] rescue {}).merge(ENV) # support yaml and heroku config
  
  #config.action_controller.session = {
   # :key => CONFIG['session_key'],
  #  :secret => CONFIG['session_secret'] || CONFIG['secret']
#  }
  config.action_controller.session = { :key => "h8ter_development", :secret => "XSheUg1YEEkLX6bSCJYiwgNiV859hL2q" }
    
  RE_LOGIN_RES = %w(admin all test help blog faq message messages login logout signup settings 
    register home info pages page faq follow followers following followings network networks 
    invitations invitation users user about contact status downloads api jobs tos privacy favorites 
    hate hates updates search devices device public phones phone profile profiles account accounts 
   notifications notification subscription subscriptions welcome welcomes fail fails everyone everybody)
  
end


