# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
secret = Rails.env.production? ? ENV["SECRET_TOKEN"] : "62da999984791212c0505a52f2e035afb6aa1bf31ee968cee481057ecb4925ed3e0d81f1c518cd21cc44eda8dcb220a0393a99be1a68d4d07061ad49d4584662"
Urbanity::Application.config.secret_key_base = secret
