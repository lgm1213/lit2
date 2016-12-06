OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
 provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
end


# OmniAuth.config.logger = Rails.logger

# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :facebook, 'my facebook app id', 'my facebook app secret', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
# end