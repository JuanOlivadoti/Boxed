Rails.application.routes.draw do

	root 'static_pages#home'

  get 'static_pages/home'
  get 'static_pages/help'
  
  devise_for :users

  resources :trainclasses

  get   '/users/:user_id/athlete_info/bookings',    to: "users#bookings",         as: :athlete_booking_index
  post  '/users/:user_id/athlete_info/bookings/:id',    to: "bookings#create",        as: :booking_create
  delete '/bookings/:id',                           to: 'bookings#destroy', 	    as: :booking_destroy

  get   '/users/:user_id/athlete_info/information', to: "users#information",	     as: :athelet_info
  
  resources :users do
  		resources :my_fit_tracker
  end

  post    '/users/:user_id/my_fit_tracker', to: "my_fit_tracker#create",  as: :create_user_my_fit_tracker
  delete  '/users/:user_id/my_fit_tracker', to: "my_fit_tracker#destroy", as: :destroy_user_my_fit_tracker

  get '/users/:user_id/athlete_info/my_fit', to: "users#my_fit_tracker", as: :my_fit_tracker_index
end
