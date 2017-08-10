    Rails.application.routes.draw do
      mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
      root 'home#index'

      devise_for :users, controllers: {
        registrations:      'registrations',
        omniauth_callbacks: 'omniauth_callbacks'
      }

      devise_scope :user do
        patch '/password', to: 'registrations#change_password', as: :change_password
      end

      resources :users, only: %i[index]

      resources :dialogs, except: %i[edit] do
        resources :messages, only: %i[create]
      end

      resources :profiles, only: %i[update]
    end
