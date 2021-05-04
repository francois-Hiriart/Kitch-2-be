Rails.application.routes.draw do

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
    resources :users
    resources :kitchens
    resources :bookings

  resources :bookings, only: [:index, :show, :destroy]
  resources :kitchens do
    resources :bookings, only: [:new, :create]
  end

  resources :users do
    resources :messages, only: [:index, :create]
  end
end
