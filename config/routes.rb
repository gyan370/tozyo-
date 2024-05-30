Rails.application.routes.draw do

   
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
  
  devise_scope :admin do
  get '/admin/sign_in', to: 'admin/sessions#new'
 end
 
  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
  end
  

  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
    resources :reviws, only: [:new, :create, :index, :show, :destroy] do
    resources :reviw_comments, only: [:create]
  end
  root to: 'homes#top'
  get 'home/about', to: 'homes#about', as: 'about'
  resources :users, only: [:index, :show, :edit, :update]
  resources :reviws, only: [:new, :index, :show, :edit, :update, :create, :destroy]
  get '/reviws', to: 'reviws#index'
  get "search" => "searches#search"
  resource :map, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
