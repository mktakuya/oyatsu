Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  namespace :api, path: nil, defaults: { format: 'json' } do
    namespace :v1 do
      resource :users, only: [ :create ] do
        post 'sign_in'
        get 'me'
      end
      resources :items
    end
  end
end
