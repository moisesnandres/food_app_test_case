Rails.application.routes.draw do
  resources :categories, only: [:index]
  resources :meals, only: [:index]
end
