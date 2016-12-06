Rails.application.routes.draw do

	root 'static_pages#home'
  
  devise_for :users, controllers: {
        sessions: 'users/sessions'}

  resources :users do
  	resources :bookings
  end
  
  resources :trainclasses
  
  get 'static_pages/home'
  get 'static_pages/help'

end
