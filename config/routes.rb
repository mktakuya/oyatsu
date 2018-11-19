Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  namespace :api, path: nil, defaults: { format: 'json' } do
    namespace :v1 do
      resources :users, only: [ :create ] do
        collection do
          post 'sign_in'
          get 'me'
        end
      end
      resource :account, only: [ :update ] do
        collection do
          patch :password
        end
      end
      resources :items
    end
  end
end
