Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  devise_for :users
  
  root 'workshops#index'
  resources :workshops, only: %i[index show new create ]
  resources :bookings, only: %i[create]
  post 'payment_completed', to: 'bookings#payment_completed'
  
  
  get 'search', to: 'workshops#search'
  get "show/bookings", to: 'bookings#all_booking'
  get "success", to: 'bookings#success'
  resources :refunds do
    get :refund_acceptance, do: :member
  end

  namespace :admin do
    get 'dashboard' => 'dashboard#index'
  end
end
