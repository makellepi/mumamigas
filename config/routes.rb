Rails.application.routes.draw do
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users #controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users

  root to: 'pages#home'
  get '/search', to: 'pages#search', as: 'search'


  resources :users do
    resources :locations, only: [:index, :new, :create]
  end
  resources :locations, only: [:show]

end
