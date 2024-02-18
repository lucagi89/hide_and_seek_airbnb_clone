Rails.application.routes.draw do
  devise_for :users
  root to: "flats#home"
  resources :flats, only: %i[new destroy] do
    resources :bookings, only: %i[new create update]
  end
  resources :reviews, only: %i[show create destroy]
end
