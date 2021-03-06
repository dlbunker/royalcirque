Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Log error messages when you accidentally call methods on nil.
  # config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Only use best-standards-support built into browsers
  # config.action_dispatch.best_standards_support = :builtin

  # Do not compress assets
  # config.assets.compress = false

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # config.action_mailer.default_url_options = { :host => 'localhost:3000' }

  # config.action_mailer.delivery_method  = :mailgun
  # config.action_mailer.mailgun_settings = {
  #   api_host: "https://api.mailgun.net/v3/mg.royalcirquepub.com",
  #   api_key:  "key-04601611b1f0e3445279091dfbd4260a"
  # }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :authentication => :plain,
    :address => "smtp.mailgun.org",
    :port => 587,
    :domain => "mg.royalcirquepub.com",
    :user_name => "postmaster@mg.royalcirquepub.com",
    :password => "51c6eb2386fd47afb4fe51fa287e0acb"
  }
end
