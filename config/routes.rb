Rails.application.routes.draw do

  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      resources :contents, only: [:index]
      resources :movies, only: [:index]
      resources :seasons, only: [:index]
    end
  end
end
