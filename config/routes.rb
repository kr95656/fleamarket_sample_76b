Rails.application.routes.draw do
  root to: "top#index"
  resources :items, only: [:new, :create]
end
