Rails.application.routes.draw do
  root 'home#index'

  get '/auth/spotify/callback', :to => 'sessions#create'
  get '/auth/failure', :to => 'sessions#failure'
end
