Rails.application.routes.draw do
  get '/welcome', to: 'welcome#index', as: 'welcome'
  get 'entities/new'
  get 'entities/destroy'
  get 'entities/edit'
  get 'entities/update'
  get 'entities/index'
  devise_for :users, sign_out_via: [:get, :post], controllers: { registrations: "users/registrations" }
  resources :users, only: [:index, :show, :destroy] do
    resources :groups do
      resources :entities
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  root 'groups#index'
end
