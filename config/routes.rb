Rails.application.routes.draw do
  root "static_pages#top"

  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks"
  }

  resources :web_apps, only: %i[index show] do
    collection do
      get :todayapp
    end

    resources :reviews, only: %i[create]
  end
end
