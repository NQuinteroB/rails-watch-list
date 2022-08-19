Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'lists', to: 'lists#index', as: :lists
  get 'lists/new', to: 'lists#new', as: :new
  get 'lists/:id', to: 'lists#show', as: :list

  resources :lists, except: [:edit, :update] do
    resources :bookmarks, only: [:new, :create]
    resources :reviews, only: :create
  end
  resources :bookmarks, only: :destroy
  resources :reviews, only: :destroy
  # create
end
