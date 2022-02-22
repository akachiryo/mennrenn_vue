Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:show, :create, :update]
      resource :session, only: [:create, :destroy]
      resources :rooms
      resources :tags, only: [:index]
      resources :user_rooms, only: [:index, :create, :destroy]
      resources :room_messages, only: [:show, :create, :destroy]
      namespace :me do
        resource :account, only: [:update]
      end
      namespace :admin do
        resources :users
      end
    end
  end
end
