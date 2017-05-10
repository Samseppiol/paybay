Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'pages#index'
  resources :listings do
    resources :orders, only: [:new, :create]
  end
  resources :pages, only: [:index]
  get 'pages/about'

  get 'pages/contact'
  get 'vendor' => 'listings#vendor'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
