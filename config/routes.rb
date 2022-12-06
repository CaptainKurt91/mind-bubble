Rails.application.routes.draw do
  get 'search/index'
  devise_for :users
  root to: "categories#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :categories, only: %i[index show] do
    resources :tasks, only: %i[new create]
    resources :category_notes, only: %i[new create]
    resources :category_files, only: %i[new create]
    resources :category_checklists, only: %i[new create]
  end

  resources :category_notes, only: %i[show edit update destroy]
  resources :category_files, only: %i[show edit update destroy]
  resources :category_checklists, only: %i[show edit update destroy]

  resources :category_checklists, only: %i[show] do
    resources :category_checklist_items, only: %i[new create edit update]
  end

  resources :tasks, only: %i[show edit update destroy] do
    resources :task_notes, only: %i[new create]
    resources :task_files, only: %i[new create]
    resources :task_checklists, only: %i[new create]
  end

  resources :task_notes, only: %i[show edit update destroy]
  resources :task_files, only: %i[show edit update destroy]
  resources :task_checklists, only: %i[show edit update destroy]

  resources :task_checklists, only: %i[show] do
    resources :task_checklist_items, only: %i[new create edit update]
  end

  resources :category_checklist_items, only: %i[destroy] do
    member do
      patch :update_checklist
    end
  end

  resources :task_checklist_items, only: %i[destroy] do
    member do
      patch :update_checklist
    end
  end
end
