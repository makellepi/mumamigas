Rails.application.routes.draw do

   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 as :user do
  get '/users/sign_up', to: 'devise/registrations#new'
end


  devise_for :users


  root to: 'pages#home'
  get '/search', to: 'pages#search', as: 'search'
  get '/friends', to: 'pages#friends', as: 'friends'
  get '/mesages', to: 'pages#messages', as: 'messages'


  resources :users



  resources :matches, only: [ :new, :create, :show, :index ]


  resources :interests


  resources :matches, only: [:show] do
    resources :messages, only: [ :new, :create ]
  end


  get "/matches/:id/accept", to: 'matches#accept', as: 'accept'
  get "/matchess/:id/decline", to: 'matches#decline', as: 'decline'

  get "/friends", to: 'users#friends'

  post '/search/:query' => 'search#index'

end
