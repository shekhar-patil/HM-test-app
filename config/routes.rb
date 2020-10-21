Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      namespace :customers do
        devise_scope :user do
          post "sign_up", to: "registrations#create"
        end
      end

      namespace :partners do
        devise_scope :user do
          post "sign_up", to: "registrations#create"
        end
      end

      resources :users
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
