Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#home'
  
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#logout'

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'


  resources :games do 
    resources :posts do
      resources :comments
    end
  end

  resources :posts

  resources :users
  
  
end
