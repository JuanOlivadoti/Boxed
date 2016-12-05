Rails.application.routes.draw do
  get 'static_pages/home'

  get 'static_pages/help'

  devise_for :users, controllers: {
        sessions: 'users/sessions'}
  # devise_for :users  
end
