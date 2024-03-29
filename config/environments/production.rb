PET::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the webserver when you make code changes.
  config.cache_classes = true

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = false

  config.consider_all_requests_local       = true
  config.action_view.debug_rjs             = false
  config.action_controller.perform_caching = true

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  config.root_url = 'sharp-autumn-9028.heroku.com'


  require 'tlsmail' #key but not always described
  Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)

  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.perform_deliveries = true
  ActionMailer::Base.raise_delivery_errors = true

  config.action_mailer.smtp_settings = {
    :enable_starttls_auto => true,
    :address        => 'smtp.gmail.com',
    :port           => 587,
    :domain         => 'gmail.com',
    :authentication => :plain,
    :user_name      => 'cmu.team.maglev',
    :password       => 'TeAmMaGlEv'
  }

end

