Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      namespace :customer do
        devise_scope :user do
          post "sign_up", to: "registrations#create"
        end
      end

      namespace :admin do
        devise_scope :user do
          post "sign_up", to: "registrations#create"
        end
      end

      resources :hotels do
        resources :rooms
      end

      post 'reservations/create'
      get 'reservations/show'

      resources :users
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
