Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :languages, except: [:index, :show, :destroy] do
    resources :slides, except: :destroy do
      collection { get :current }
    end
  end

  # Auth0
  get 'auth/auth0/callback' => 'auth0#callback'
  get 'auth/failure' => 'auth0#failure'
  post 'auth/logout' => 'logout#logout'
  get 'auth/logged_out' => 'logout#logged_out'
  post 'test_login' => 'auth0#test_login' unless Rails.env.production?

  root 'languages#index'
end
