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

    resources :orders, only: [:edit, :update]

    resources :order_details, only: [:update]

  end

  scope module: :public do

    resources :items, only: [:index, :show]

    root to: 'homes#top'
    get 'about' => 'homes#about', as:'about'

    resources :cart_items, only: [:index, :update, :destroy, :create]
    delete 'destroy_all' => 'cart_items#destroy_all'

    resources :orders, only: [:new, :create, :index, :show]
    post 'confirmation' => 'orders#confirmation', as: "order_confirmation"
    get 'thanks' => 'orders#thanks'

    resources :addresses, only: [:index, :edit, :create, :update, :destroy]

    resources :customers, only: [:show, :edit, :update]
    get 'costomer/confirmation', to: 'customers#confirmation', as: "withdrawal_confirmation"
    patch 'withdrawal' => 'customers#withdrawal'

  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
