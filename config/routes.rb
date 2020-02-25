Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[index show edit update] do
    resources :bookings, only: %i[index new create destroy]
  end
end
