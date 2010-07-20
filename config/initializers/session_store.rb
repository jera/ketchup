# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ketchup-web_session',
  :secret      => '76b6b889bda34739782a2175a3fa59cc142b80694f02e0a315ca9b4ce97a83bbab440c2f849aea9f0b8c0506cca3a01889040bb8dda8394874d286b0b8925ed5'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
