Rails.application.routes.draw do
  get 'purchase/index'
  get 'purchase/done'
  get 'card/new'
  get 'card/show'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }

  devise_scope :user do
    get 'profiles', to: 'users/registrations#new_profile'
    post 'profiles', to: 'users/registrations#create_profile'
    post 'shipping_destinations', to: 'users/registrations#create_shipping_destination'
    get 'shipping_destinations', to: 'users/registrations#new_shipping_destination'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "top#index"

  resources :users, only: :show do
    get 'logout' => "users#logout"
  end

  # resources :items, only: [:new, :create, :show, :edit, :update, :destroy]

  resources :items, except: :index do
    collection do
      get 'pay'
      get 'categoryChildren'
      get 'categoryGrandChildren'
    end
    member do
      get 'categoryChildren'
      get 'categoryGrandChildren'
    end
    resources :purchase, only: [:index] do
      collection do
        get 'index', to: 'purchase#index'
        post 'pay', to: 'purchase#pay'
        get 'done', to: 'purchase#done'
      end
    end  
  end

  resources :card, only: [:new, :show, :index] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

end
