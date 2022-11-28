Rails.application.routes.draw do

devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  scope module: :public do
    root to: 'homes#top'
    get 'homes/about'=> "homes#about", as:'about'
    resources :items, only: [:show, :index]
    resources :customers, only: [:show, :edit, :update]
    get "public/customers" => "customers#unsubscribe"
    patch "public/customers" => "customers#unsubscribe_process"
    resources :cart_items, only: [:create, :index, :update, :destroy]
    delete 'cart_items' => 'cart_items#destroy_all'
    resources :orders, only: [:new, :create, :show, :index]
    post 'public/orders' => 'orders#infor#check'
    get 'public/orders' => 'orders#completed'
    resources :addresses, only: [:create, :edit, :update, :index, :destroy]

  end

   namespace :admin do
     root to: 'homes#top'
    resources :items, only: [:new, :show, :create, :edit, :index, :update]
    resources :genres, only: [:create, :index, :update, :edit]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:update, :show]
    resources :order_details, only: [:update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
