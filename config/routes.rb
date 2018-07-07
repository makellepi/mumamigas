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
  get '/messages', to: 'pages#messages', as: 'messages'
  get '/activities', to: 'pages#activities', as: 'activities'
  get '/matches', to: 'users#matches', as: 'matches'

  resources :users do |variable|
    get :profile
    resources :messages, only: [:new, :create] #-> domain.com/users/:user_id/messages/new
  end

  resources :messages, only: [:index, :show, :destroy]

  resources :follows


  # resources :matches, only: [ :new, :create, :show, :index ]


  # resources :interests


  # resources :matches, only: [:show] do

  # end

  resources :activities, only: [ :new, :create, :index, :show ]

  # get "/matches", to: 'users#matches'

  # get "/matches/:id/accept", to: 'matches#accept', as: 'accept'
  # get "/matchess/:id/decline", to: 'matches#decline', as: 'decline'

  get "/friends", to: 'users#friends'

  post '/search/:query' => 'search#index'



end
