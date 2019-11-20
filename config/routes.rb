Rails.application.routes.draw do

  root to: "posts#index"

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/search", to: "posts#search"

  namespace :admin do
    resources :users
  end


  resources :posts


  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
