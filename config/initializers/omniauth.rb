require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify,
  Rails.application.secrets['client_id'],
  Rails.application.secrets['client_secret'],
  scope: 'playlist-read-private'
end
