Rails.application.routes.draw do

	root 'static_pages#home'

  get 'static_pages/home'
  get 'static_pages/help'
  
  devise_for :users

  resources :trainclasses

  get   '/users/:user_id/athlete_info/bookings',    to: "users#bookings",             as: :athlete_booking_index
  post  '/users/:user_id/athlete_info/bookings',    to: "bookings#create",            as: :booking_create
  delete '/bookings/:id', to: 'bookings#destroy', as: :booking_destroy

  get   '/users/:user_id/athlete_info/information', to: "users#information",          as: :athelet_info

end
