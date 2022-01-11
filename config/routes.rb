Rails.application.routes.draw do
  resources :rooms

  namespace :api do
    resources :users, only: [:create]
    resource :session, only: [:create, :destroy]
  end

  namespace :admin do
    resources :users
  end
end
