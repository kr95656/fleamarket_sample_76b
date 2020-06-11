Rails.application.routes.draw do
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

  resources :items, only: [:new, :create, :show, :edit, :update]
end
