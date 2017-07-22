Rails.application.routes.draw do
  resources :business_addresses
  devise_for :admins, path: 'admin', controller: {sessions: 'users/sessions'}
  resources :business_event_categories
  resources :business_events
  resources :business_listings
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, path: 'users'
  # token auth routes available at /api/v1/auth
  namespace :api, defaults: {format: :json} do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      resources :business_event_categories, path: 'category', only: [:index, :show] do
        resources :business_events, path: 'event', only: [:index, :show]
      end
      resources :business_events, path: 'event', only: [:index, :show]
    end
  end

  root :to => redirect('/admin')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
