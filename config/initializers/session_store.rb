# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# ActionController::Base.session = {
#   :key         => '_royalcirquepub_session',
#   :secret      => '53940a646a40fd0ce1f45aab5c778af0cd99418b59d3c0ece501739672941e38e1de2aad778b1ae1a35d7cd469f128954443c770bb8d44c5d48a724b2ab5b3e1'
# }

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

# Be sure to restart your server when you modify this file.

Rails.application.config.session_store :cookie_store, :key => '_royalcirquepub_session'

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Tgb::Application.config.session_store :active_record_store
