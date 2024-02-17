Rails.application.routes.draw do
  devise_for :users
  root to: "properties#home"
  resources :properties, only: %i[new destroy]
end
