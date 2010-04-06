# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_agentrock_session',
  :secret => '684e92f15b0ba799ff1561f38aeec853acb32dffdf03e9aeaed87d5d305b0efb62910a9ae0fc5390cbd84d74d9c9fa6c0d35ac9e9fad4568ebc5e3c5ee4d2922'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
