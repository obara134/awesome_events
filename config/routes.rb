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
  get "/past_events/users/:id" => "users#past_events"
  get "/future_events/users/:id" => "users#future_events"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show]
end
