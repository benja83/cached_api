Rails.application.routes.draw do

  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      resources :contents, only: [:index] do
        resources :purchases, only: [:create]
      end
      resources :movies, only: [:index]
      resources :seasons, only: [:index]
      resources :library, only: [:index]
    end
  end
end
