Rails.application.routes.draw do
  devise_for :users
  root to: "flats#home"
  resources :flats do
    resources :bookings, only: %i[index new create update]
  end
  resources :reviews, only: %i[show create destroy]
end
