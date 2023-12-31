Rails.application.routes.draw do
  root "static_pages#top"

  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks",
    registrations: "users/registrations"
  }
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end

  resources :web_apps, only: %i[index show] do
    collection do
      get :todayapp
      get :my_tags
    end

    resources :reviews, only: %i[new create edit update]
  end

  resource :mypage, only: %i[show] do
    collection do
      get :bookmark
      get :notification
      post :setting_notify
      delete :remove_notify
    end
  end
  resources :bookmarks, only: %i[create destroy]

  namespace :admin do
    root to: "dashboards#index"
    resources :web_apps
    resources :users, only: %i[index show edit update destroy]
  end

  get '/terms', to: 'static_pages#terms'
  get '/privacy_policy', to: 'static_pages#privacy_policy'
end
