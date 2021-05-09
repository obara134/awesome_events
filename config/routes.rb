Rails.application.routes.draw do
  devise_for :users

  root to: "homes#top"
  get "homes/about" => "homes#about"
  resources :events do
    resources :tickets, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
