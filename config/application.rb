require File.expand_path('../boot', __FILE__)

require "action_controller/railtie"
require "action_mailer/railtie"
require "active_resource/railtie"
require "mongoid/railtie"

# Auto-require default libraries and those for the current Rails environment.
Bundler.require :default, Rails.env

module Agentrock
  class Application < Rails::Application

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

			config.session_store :cookie_store, :key => '_agentrock_session',
  	:secret => '684e92f15b0ba799ff1561f38aeec853acb32dffdf03e9aeaed87d5d305b0efb62910a9ae0fc5390cbd84d74d9c9fa6c0d35ac9e9fad4568ebc5e3c5ee4d2922', :domain => '.agentrock.net'

    config.secret_token = 		"1bb6af6bb18bc2984a4b5c13a226204594793f58e0a80d14d9cdff4bda775763454f1af696be7882f989e919e305f5bcacc7e4256c0a584800bb3eed98681c12"
    
    # Add additional load paths for your own custom dirs
    # config.load_paths += %W( #{config.root}/extras )

    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]
		
    # Activate observers that should always be running
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer
		
    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
    # config.i18n.default_locale = :de

    # Configure generators values. Many other options are available, be sure to check the documentation.
    config.generators do |g|
      g.orm             :mongoid
      g.template_engine :erb
      g.test_framework  :test_unit, :fixture => false
    end

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters << :password
  end
end
