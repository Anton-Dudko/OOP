Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    resources :campaigns do
      resources :comments
      resources :tidings
      resources :rewards
    end

    resources :tags, only: [:show]
    resources :categories
    root to: 'campaigns#index', as: "home"
    get 'persons/profile', as: 'user'
    devise_for :users
  end
end
