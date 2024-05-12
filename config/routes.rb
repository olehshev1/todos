# frozen_string_literal: true

Rails.application.routes.draw do
  scope '(:locale)', locale: /en|uk|ru/ do
    root to: 'home#show'
    get 'index.html', to: 'home#show'
    resources :lists, only: :index do
      resources :todos, only: :index
    end
    namespace :admin do
      root to: 'home#show'
      get 'readonly', to: 'home#readonly'
      resources :statuses
      resources :accesses
      resources :lists do
        resources :todos do
          get :readonly, on: :collection
          put :done, on: :member
        end
      end
    end

    # devise_for :users,
    #           path_names: {sign_in: 'login',
    #                        sign_out: 'logout',
    #                        password: 'secret',
    #                        sign_up: 'registration'},
    #           controllers: {sessions: 'users/sessions',
    #                         registrations: 'users/registrations',
    #                         passwords: 'users/passwords',
    #                         confirmations: 'users/confirmations',
    #                         unlocks: 'users/unlocks',
    #           }
    devise_for :users, skip: %i[sessions registrations passwords confirmations unlock]
    as :user do
      get 'login.html', to: 'users/sessions#new', as: :new_user_session
      post 'login.html', to: 'users/sessions#create', as: :user_session
      match 'logout.html', to: 'users/sessions#destroy', as: :destroy_user_session, via: Devise.mappings[:user].sign_out_via

      get 'registration.html', to: 'users/registrations#new', as: :new_user_registration
      post 'registration.html', to: 'users/registrations#create', as: :user_registration
      get 'edit-registration.html', to: 'users/registrations#edit', as: :edit_user_registration
      patch 'registration.html', to: 'users/registrations#update', as: :patch_user_registration
      delete 'registration.html', to: 'users/registrations#destroy', as: :delete_user_registration
      delete 'remove-avatar/:id', to: 'users/registrations#destroy_avatar', as: :delete_user_avatar_registration

      get 'recover-password.html', to: 'users/passwords#new', as: :new_user_password
      post 'recover-password.html', to: 'users/passwords#create'
      get 'edit-recover-password.html', to: 'users/passwords#edit', as: :edit_user_password
      patch 'recover-password.html', to: 'users/passwords#update', as: :user_password
      put 'recover-password.html', to: 'users/passwords#update'

      get 'confirmation.html', to: 'users/confirmations#new', as: :new_user_confirmation
      get 'show-confirmation.html', to: 'users/confirmations#show', as: :user_confirmation
      post 'show-confirmation.html', to: 'users/confirmations#create'

      get 'unlock.html', to: 'users/unlocks#new', as: :new_user_unlock
      get 'show-unlock.html', to: 'users/unlocks#show', as: :user_unlock
      post 'show-unlock.html', to: 'users/unlocks#create'
    end

     match '*a', to: 'admin/errors#not_found', via: :all unless Rails.env.development?
     # match '*a', to: 'admin/errors#not_found', via: :all
  end
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
