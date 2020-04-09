Rails.application.routes.draw do
  resources :categories
  resources :articles
  root "welcome#index"
  get "welcome/contact"
end
