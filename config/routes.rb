Rails.application.routes.draw do
  resources :rodents
  root 'dashboard#show'
end
