Rails.application.routes.draw do
  devise_for :users
  root to: "properties#home"
  resources :properties do
      resources :properties, only: [:new, :destroy]
  end
end
