Rails.application.routes.draw do
  namespace :api, path: nil, defaults: { format: 'json' } do
    namespace :v1 do
      resource :users, only: [ :create ] do
        post 'sign_in'
        get 'me'
      end
    end
  end
end
