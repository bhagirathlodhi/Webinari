Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  
  devise_for :users
  
  
  root 'workshops#index'
  resources :workshops, only: %i[index show new create]
  resources :bookings, only: :create
  resources :payment, only: :create
end
