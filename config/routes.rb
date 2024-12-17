Rails.application.routes.draw do
  get "reports/index"

  # Stocktake Entries
  resources :stocktake_entries, except: [:edit, :update, :destroy] do
    collection do
      post :create
    end
  end

  # Routes for edit, update, and destroy explicitly defined
  get    'stocktake_entries/:id/edit',  to: 'stocktake_entries#edit', as: 'edit_stocktake_entry'
  patch  'stocktake_entries/:id',       to: 'stocktake_entries#update'
  delete 'stocktake_entries/:id',       to: 'stocktake_entries#destroy'

  # Other Resources
  resources :stocktakes
  resources :products
  resources :sections

  # Devise for Users
  devise_for :users

  # Reports
  get 'reports', to: 'reports#index'

  # Health Check
  get "up" => "rails/health#show", as: :rails_health_check

  # Root Route
  root 'stocktakes#index'
end