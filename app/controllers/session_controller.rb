class SessionController < ApplicationController
  def create
    p "DID I MAKE IT IN HERE?"
    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
  end

  def failure
  end
end
