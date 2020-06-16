Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "top#index"

  resources :users, only: :show do
    get 'logout' => "users#logout"
  end

  resources :items, only: [:new, :create, :show, :edit, :update, :destroy]

  resources :items do
    collection do
      get :search
    end
  end

  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
end
