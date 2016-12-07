Rails.application.routes.draw do

	root 'static_pages#home'

  get 'static_pages/home'
  get 'static_pages/help'
  
  devise_for :users, controllers: {
        sessions: 'users/sessions'}

  get '/users/:id/bookings', to: "users#bookings", as: "user_bookings"

  resources :trainclasses

  post "/users/:id/trainclass/add" => "users#add_trainclass"
  
end
