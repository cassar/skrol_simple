Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :slides, except: [:destroy, :index]

  root 'slides#index'
end
