Rails.application.routes.draw do

  resources :users
  resources :products do
    resources :comments
  end
  
  resources :orders, only: [:index, :show, :create, :destroy]
    root 'static_pages#landing_page'

  resources :products, only: [:index, :show, :create, :destroy]
  
  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/index'

  get 'static_pages/landing_page'

  post 'static_pages/thank_you'

  post 'payments/create'

  get 'products/new'

  

  #devise custom for :users
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}, :controllers => { :registrations => "registered_users"}

  # From 6.13 ActionCable
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
