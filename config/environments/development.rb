config.cache_classes = false
config.whiny_nils = true
config.action_controller.consider_all_requests_local = true
config.action_view.debug_rjs = true
config.action_controller.perform_caching = false

config.logger = Logger.new(config.log_path, 2, 20.megabytes)

# Disable delivery errors, bad email addresses will be ignored
config.action_mailer.raise_delivery_errors = true

# set delivery method to :smtp, :sendmail or :test
config.action_mailer.delivery_method = :smtp

# these options are only needed if you choose smtp delivery
config.action_mailer.smtp_settings = {
    :address              => 'smtp.gmail.com',
    :port                 => 587,
    :domain               => 'imap.gmail.com',
    :user_name            => '<username>',
    :password             => '<password>',
    :authentication       => 'login',
    :enable_starttls_auto => true
  }