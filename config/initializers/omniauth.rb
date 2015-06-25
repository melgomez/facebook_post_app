OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, "1394577327539311", "c01727a2f16a73c331a891577ab11c65"
end