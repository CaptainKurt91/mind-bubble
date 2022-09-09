Rails.application.routes.draw do
  get 'search/index'
  get 'list/new'
  get 'list/create'
  devise_for :users
  root to: "categories#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :categories, only: [:index, :show] do
    resources :tasks, only: [:new, :create]
  end
  resources :tasks, only: [:show, :destroy, :edit, :update] do
    resources :components, only: [:new, :create]
  end
  resources :components, only: [:show, :destroy, :edit, :update] do
    resources :lists, only: [:new, :create]
  end

  resources :lists, only: [:show, :destroy, :edit, :update]
  # Defines the root path route ("/")
  # root "articles#index"
end
