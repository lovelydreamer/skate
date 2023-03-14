# Be sure to restart your server when you modify this file.

# Configure sensitive parameters which will be filtered from the log file.
# TODO: Investigate generation of this. Looks like password was truncated.
Rails.application.config.filter_parameters += [
  :passw, :secret, :token, :_key, :crypt, :salt, :certificate, :otp, :ssn
]
