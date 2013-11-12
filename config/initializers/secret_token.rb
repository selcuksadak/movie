# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
		File.read(token_file).chomp
	else
		token = SecureRandom.hex(64)
		File.write(token_file, token)
		token
	end
end

Movies::Application.config.secret_key_base = secure_token
# Movies::Application.config.secret_key_base = 'a732ae56b58e86cd631538b65016268ab552abcd1e4bc711f8e2ab65077a7aaf611a4282bf2d462d791c6dbad2fec8bd21328884df3b91453537b0e02b2e3959'