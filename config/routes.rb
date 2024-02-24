Rails.application.routes.draw do
  devise_for :users
  root to: "flats#home"

  devise_scope :user do
    get 'profile', to: 'users#show', as: :profile
    delete "/bookings/:id", to: "bookings#destroy", as: :destroy_booking
    get '/my_bookings', to: 'bookings#my_bookings', as: :my_bookings
  end

  resources :flats do
    resources :bookings, only: %i[index new create update]
  end
  resources :reviews, only: %i[show create destroy]
end
