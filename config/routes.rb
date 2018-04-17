Rails.application.routes.draw do
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users #controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users

  root to: 'pages#home'
  get '/search', to: 'pages#search', as: 'search'

  resources :users
  resources :matches, only: [:destroy, :create] do
  end
  resources :matches, only: [:show] do
    resources :messages, only: [:create]
  end


end
