Rails.application.routes.draw do
  
  namespace :api do
    resources :users, only: [:create]
    resource :session, only: [:create, :destroy]
    resources :rooms
  end

  namespace :admin do
    resources :users
  end
end
