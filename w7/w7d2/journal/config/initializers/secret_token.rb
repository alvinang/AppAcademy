# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Journal::Application.config.secret_key_base = 'f874b60912e1d1447ec2a591b99b5866a639a902f3b2fe80fb55e32bbf7a6a7cfd69a863f0242379f336c431843e08bcc19a5cc4587669532f874cb6060114c2'
