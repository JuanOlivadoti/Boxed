Rails.application.routes.draw do
  resources :trainclasses
  get 'static_pages/home'

  get 'static_pages/help'

  devise_for :users, controllers: {
        sessions: 'users/sessions'}

  root 'static_pages#home'
end
