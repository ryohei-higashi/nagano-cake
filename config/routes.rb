Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  namespace :admin do

    resources :items, except: [:destroy]

    get '/' => 'homes#top'

    resources :genres, only: [:index, :create, :edit, :update]

    resources :customers, only: [:index, :show, :edit, :update]

    resource :orders, only: [:edit, :update]
    
    resource :order_details, only: [:update]

  end

  scope module: :public do

    resources :items, only: [:index, :show]

    root to: 'homes#top'
    get 'about' => 'homes#about', as:'about'

    get 'index' => 'cart_items#index'
    patch 'update' => 'cart_items#update'
    patch 'destroy' => 'cart_items#destroy'
    delete 'destroy_all' => 'cart_items#destroy_all'
    post 'create' => 'cart_items#create'

    get 'new' => 'orders#new'
    post 'confirmation' => 'orders#confirmation'
    get 'thanks' => 'orders#thanks'
    post 'create' => 'orders#create'
    get 'index' => 'orders#index'
    get 'show' => 'orders#show'

    resources :addresses, only: [:index, :edit, :create, :update, :destroy]

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
