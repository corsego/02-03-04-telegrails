Rails.application.routes.draw do
  resources :posts
  root 'home#index'
  get 'home/index'
  post "home/send_message", to: "home#send_message"
  post "home/send_hello", to: "home#send_hello", as: "send_hello"
  get "sessions/create", to: "sessions#create"
  delete "sessions/destroy", to: "sessions#destroy"
  get "sessions/new", to: "sessions#new"
end
