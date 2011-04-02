# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)

use Rack::Mole, { :app_name => "Agent Rock", :user_key => :session_id }
use Rack::Bundle, :public_dir => "#{Rails.root}/public"

run Agentrock::Application