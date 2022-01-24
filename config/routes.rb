Rails.application.routes.draw do
  namespace :api do
    resources :users, only: [:show, :create, :update]
    resource :session, only: [:create, :destroy]
    resources :rooms
    resource :user_room, only: [:create, :destroy]
    resources :room_messages, only: [:index, :create, :destroy]
    namespace :me do
          resource :account, only: [:update]
        end
  end

  namespace :admin do
    resources :users
  end
end
