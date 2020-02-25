Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[index show new create edit update] do
    resources :bookings, only: %i[index new create]
  end
  resources :bookings, only: %i[destroy]
end
