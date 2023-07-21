Rails.application.routes.draw do
  root "static_pages#top"
  devise_for :users
  resources :web_apps, only: [:index, :show] do
    collection do
      get :todayapp
    end
  end
end
