Rails.application.routes.draw do

  root "events#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show, :index]
  resources :events, only: [:new, :create, :edit,:show, :index] do 
    member do
      get 'rsvp'
      get 'cancel_rsvp'
    end
  end



  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'
end
