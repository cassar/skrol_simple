Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :languages, except: [:index, :show, :destroy] do
    resources :slides, except: :destroy
  end

  root 'languages#index'
end
