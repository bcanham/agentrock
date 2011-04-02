Agentrock::Application.configure do
  # Settings specified here will take precedence over those in config/environment.rb

  # The production environment is meant for finished, "live" apps.
  # Code is not reloaded between requests
  config.cache_classes = true

  # Full error reports are disabled and caching is turned on
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # See everything in the log (default is :info)
  # config.log_level = :debug
  
  config.active_support.deprecation = :notify

  # Use a different logger for distributed setups
  # config.logger = SyslogLogger.new

  # Use a different cache store in production
  # config.cache_store = :mem_cache_store

  config.session_store = { :domain => '.agentrock.net' }

  # Disable Rails's static asset server
  # In production, Apache or nginx will already do this
  config.serve_static_assets = true

  # Enable serving of images, stylesheets, and javascripts from an asset server
  # config.action_controller.asset_host = "http://assets.example.com"

  # Disable delivery errors, bad email addresses will be ignored
  config.action_mailer.raise_delivery_errors = false
	config.action_mailer.default_url_options = { :host => 'agentrock.net' }
  config.action_mailer.delivery_method = :remail
  config.action_mailer.remail_settings = {
    :app_id  => "remail-agentrock",
    :api_key => "677aee17d4c2e015acf0754c909e7340a14101521b218291fa00906c2aa8f1db827565b2aebfa83d1fb5a2c08f1417bb50b111880fc98afa208cadd7e37915f7"
  }
  # config.action_mailer.smtp_settings = {
  #     :tls => true,
  #     :address => "smtp.gmail.com",
  #     :port => "587",
  #     :domain => "agentrock.net",
  #     :authentication => :plain,
  #     :user_name => "agentrock.net@gmail.com",
  #     :password => "schi3$$way"
  #   }

  # Enable threaded mode
  # config.threadsafe!
end
