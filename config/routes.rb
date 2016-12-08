Rails.application.routes.draw do

	root 'static_pages#home'

  get 'static_pages/home'
  get 'static_pages/help'
  
  devise_for :users

  get '/users/:id/bookings', to: "users#bookings", as: "user_bookings"

  resources :trainclasses

  # post "/users/:id/trainclass/add" => "users#add_trainclass"
  get '/users/:user_id/booking/', to: 'bookings#index', as: :booking_index
  post '/users/:user_id/booking/', to: 'bookings#create', as: :booking_create
  delete '/bookings/:id', to: 'bookings#destroy', as: :booking_destroy
  
end
