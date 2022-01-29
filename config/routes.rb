Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :admins, only: [:create]
      resources :houses, only: [:create, :index, :show, :update, :destroy]

      post '/login', to: 'auth#login'
    end
  end
end
