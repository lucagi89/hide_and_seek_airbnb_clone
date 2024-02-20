Rails.application.routes.draw do
  devise_for :users
  root to: "flats#home"
<<<<<<< HEAD
  resources :flats, only: %i[new show destroy] do
    resources :bookings, only: %i[new create update]
=======
  resources :flats do
    resources :bookings, only: %i[index new create update]
>>>>>>> 93dd65c569cc8b8a543f856c07d73e8a65b1fbfc
  end
  resources :reviews, only: %i[show create destroy]
end
