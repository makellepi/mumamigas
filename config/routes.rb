Rails.application.routes.draw do

   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 as :user do
  get '/users/sign_up', to: 'devise/registrations#new'
end

  resources :cities, only: :index
  resources :states, only: :index

  devise_for :users


  root to: 'pages#home'
  get '/search', to: 'users#index', as: 'search'
  get '/friends', to: 'pages#friends', as: 'friends'
  get '/mesages', to: 'pages#messages', as: 'messages'
  get '/activities', to: 'pages#activities', as: 'activities'


  resources :users do
    member do
      get :follow
      get :unfollow
    end
  end

  resources :follows


  # resources :matches, only: [ :new, :create, :show, :index ]


  resources :interests


  # resources :matches, only: [:show] do
  #   resources :messages, only: [ :new, :create ]
  # end

  resources :activities, only: [ :new, :create, :index, :show ]

  get "/matches", to: 'users#matches'

  # get "/matches/:id/accept", to: 'matches#accept', as: 'accept'
  # get "/matchess/:id/decline", to: 'matches#decline', as: 'decline'

  get "/friends", to: 'users#friends'

  post '/search/:query' => 'search#index'



end
