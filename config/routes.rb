Rails.application.routes.draw do

	root 'static_pages#home'
  
  devise_for :users, controllers: {
        sessions: 'users/sessions'}

  resources :users
  
  get '/users/:id/bookings', to: "user#bookings", as: "user_bookings"

  resources :trainclasses do
  	resources :bookings
  end

  post '/trainclasses/:trainclass_id/bookings',to: "bookings#create", 
  	as: "booking_create"
  
  get 'static_pages/home'
  get 'static_pages/help'

end
