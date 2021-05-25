Rails.application.routes.draw do
  get 'notifications/index'
  get 'users/show'
  get 'search/search'
  devise_for :users
  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
  end

  root to: "events#index"
  resources :events do
    resources :ticket_comments, only: [:create, :destroy]
    resources :event_comments, only: [:create, :destroy]
  end


  get 'search/search'
  get '/search', to: 'search#search'
  resources :users, only: [:show, :edit, :update]
  get "/past_index/users/:id" => "users#past_index"
  get "/expect_index/users/:id" => "users#expect_index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show]
end
