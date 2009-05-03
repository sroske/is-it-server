# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_is-it_session',
  :secret      => 'd21caa7f882d5172bde8da14ff69876fc3c332df07710811028d83b2e9e3f95b449c2cb45ecfd7b309ec11eee84cedf422d905940adea04c18d7306ab1b788ab'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
