require 'httparty'
# require 'uri'
# require 'net/http'

class SpotifyAdapter

  include HTTParty

  base_uri "accounts.spotify.com"
  format :json

  default_params  client_id: Rails.application.secrets.client_id,
                  client_secret: Rails.application.secrets.client_secret,
                  # response_type: 'code',
                  scope: 'playlist-read-private',
                  redirect_uri: Rails.application.secrets.redirect_uri
  # access_token_url: 'https://accounts.spotify.com/api/token'

  def initialize
    @options = { headers: {"Authorization":"Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZXMiOlsicHJvZmlsZSIsInBsYWNlcyIsImhpc3RvcnkiLCJyaWRlX3dpZGdldHMiLCJyZXF1ZXN0Il0sInN1YiI6IjBmYWNmZGE1LTVjZWItNGYyNy1iZjMxLTU2ZmU5YTc3YTBjYyIsImlzcyI6InViZXItdXMxIiwianRpIjoiN2Q0MTMwNDEtOTYwZi00ZGMzLWE3NTUtYjU4ZTdkMzAwYzJiIiwiZXhwIjoxNDY2MDkwMzkxLCJpYXQiOjE0NjM0OTgzOTAsInVhY3QiOiJFQUNibW85dHBPMTFrbWhHdFhZQkE1QklMak9sbUciLCJuYmYiOjE0NjM0OTgzMDAsImF1ZCI6ImtoaUVvNUhNWVFPVGRITzlPd3JlT1ZRc0xCWmt0bDRIIn0.B1Jw_Y3UBAOoKrCH2bLaEQ_qArC1jcOAFYmdQBTGw3jSla0ffduPkBCtlbYUvKT7sGv0I1F1LIFWPW2PWvJjxDrLUda-C5hUXJEYCL-vCV0ntedZF4MZN6P8wK7HcsK5XHgnTBsYNhv1lkMevFVtkI-7OEHUIoQL6QfP-lejcLMFBCtu78HTitLAF3hcPQQiDwMvgabMsOm7Fs2UY2U8gbdCOHIHZlBGcC9tzGRUs6NY3-DVkUNUIUpEN41D6DbSOsXxyQ3PqxIJjfUSIJSw2-_seJC7eI8_goTEWpG0iezYYFeVlc_pV4OjY1LkrX1U45XInUGkFVO45G1w5bai-w"}}
  end

  def oauth
    JSON.parse(self.class.get('/authorize',  @options))
  end
  #
  #   url = URI("https://accounts.spotify.com/authorize?client_id=256d33e9136841118281b4e9031d12e8&response_type=code&scope=playlist-read-private&redirect_uri=http%3A%2F%2Flocalhost%3A3000%2Fauth%2Fspotify%2Fcallback")
  #
  #   http = Net::HTTP.new(url.host, url.port)
  #   http.use_ssl = true
  #   http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  #
  #   request = Net::HTTP::Get.new(url)
  #   request["authorization"] = 'Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZXMiOlsicHJvZmlsZSIsInBsYWNlcyIsImhpc3RvcnkiLCJyaWRlX3dpZGdldHMiLCJyZXF1ZXN0Il0sInN1YiI6IjBmYWNmZGE1LTVjZWItNGYyNy1iZjMxLTU2ZmU5YTc3YTBjYyIsImlzcyI6InViZXItdXMxIiwianRpIjoiN2Q0MTMwNDEtOTYwZi00ZGMzLWE3NTUtYjU4ZTdkMzAwYzJiIiwiZXhwIjoxNDY2MDkwMzkxLCJpYXQiOjE0NjM0OTgzOTAsInVhY3QiOiJFQUNibW85dHBPMTFrbWhHdFhZQkE1QklMak9sbUciLCJuYmYiOjE0NjM0OTgzMDAsImF1ZCI6ImtoaUVvNUhNWVFPVGRITzlPd3JlT1ZRc0xCWmt0bDRIIn0.B1Jw_Y3UBAOoKrCH2bLaEQ_qArC1jcOAFYmdQBTGw3jSla0ffduPkBCtlbYUvKT7sGv0I1F1LIFWPW2PWvJjxDrLUda-C5hUXJEYCL-vCV0ntedZF4MZN6P8wK7HcsK5XHgnTBsYNhv1lkMevFVtkI-7OEHUIoQL6QfP-lejcLMFBCtu78HTitLAF3hcPQQiDwMvgabMsOm7Fs2UY2U8gbdCOHIHZlBGcC9tzGRUs6NY3-DVkUNUIUpEN41D6DbSOsXxyQ3PqxIJjfUSIJSw2-_seJC7eI8_goTEWpG0iezYYFeVlc_pV4OjY1LkrX1U45XInUGkFVO45G1w5bai-w'
  #   request["cache-control"] = 'no-cache'
  #   request["postman-token"] = '6c9db01e-fec5-8719-28d5-eeb10149c509'
  #
  #   response = http.request(request)
  #   p response.read_body
  # end
  # GET https://accounts.spotify.com/authorize/?
  # client_id=5fe01282e44241328a84e7c5cc169165&
  # response_type=code&
  # redirect_uri=https%3A%2F%2Fexample.com%2Fcallback&
  # scope=user-read-private%20user-read-email&
  # state=34fFs29kd09
end
# https://accounts.spotify.com/authorize?
# client_id=256d33e9136841118281b4e9031d12e8&
# response_type=code&
# redirect_uri=http://localhost:3000/auth/spotify/callback
