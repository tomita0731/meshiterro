Rails.application.routes.draw do
  
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy] 
  end
  
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root to: 'homes#top'
  get "/homes/about" => "homes#about" ,as: "about"
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorite, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [ :show, :edit, :update]
end