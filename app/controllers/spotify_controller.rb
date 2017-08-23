class SpotifyController < ApplicationController
  def new
    p "*" * 100
    response = SpotifyAdapter.new
    print response.oauth
    head :no_content
  end
end
