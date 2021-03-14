Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  post "home/group_message", to: "home#group_message"
end
