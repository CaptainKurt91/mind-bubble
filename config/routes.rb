Rails.application.routes.draw do
  get 'search/index'
  devise_for :users
  root to: "categories#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :categories, only: [:index, :show] do
    resources :tasks, only: [:new, :create]
    resources :category_notes, only: [:new, :create]
    resources :category_files, only: [:new, :create]
    resources :category_checklists, only: [:new, :create]
  end

  resources :category_notes, only: [:show]
  resources :category_files, only: [:show]
  resources :category_checklists, only: [:show]

  resources :category_checklists, only: [:show] do
    resources :category_checklist_items, only: [:new, :create]
  end

  resources :tasks, only: [:show] do
    resources :task_notes, only: [:new, :create]
    resources :task_files, only: [:new, :create]
    resources :task_checklists, only: [:new, :create]
  end

  resources :task_notes, only: [:show]
  resources :task_files, only: [:show]
  resources :task_checklists, only: [:show]

  resources :task_checklists, only: [:show] do
    resources :task_checklist_items, only: [:new, :create]
  end


  resources :category_checklist_items, only: [:show, :destroy, :edit, :update]
  resources :task_checklist_items, only: [:show, :destroy, :edit, :update]
  # Defines the root path route ("/")
  # root "articles#index"
end
