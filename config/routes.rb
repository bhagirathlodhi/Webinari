Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  
  devise_for :users
  
  
  root 'home#index'
  resources :workshops, only: %i[index show]
  resources :bookings, only: %i[create]
end
