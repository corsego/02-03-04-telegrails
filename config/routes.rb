Rails.application.routes.draw do
  resources :posts
  root 'home#index'
  get 'home/index'
  post "home/group_message", to: "home#group_message"
  post "home/send_hello", to: "home#send_hello", as: "send_hello"
  get "sessions/create", to: "sessions#create"
end
