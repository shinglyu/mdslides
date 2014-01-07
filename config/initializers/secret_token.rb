# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Server::Application.config.secret_key_base = '2f81b1601a0ffb0382eff16a5c505272061ea967f33707b463e6959222d3b365520f1016bdcca84ecb95a6ee3e71968927dd7bcdf6867317f423ae67c5bfae68'
