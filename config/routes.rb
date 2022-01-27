Rails.application.routes.draw do
  namespace :api do
    resources :users, only: [:show, :create, :update]
    resource :session, only: [:create, :destroy]
    resources :rooms
    resources :user_rooms, only: [:index, :create, :destroy]
    resources :room_messages, only: [:show, :create, :destroy]
    namespace :me do
      resource :account, only: [:update]
    end
  end

  namespace :admin do
    resources :users
  end
end
