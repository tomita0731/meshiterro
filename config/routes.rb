Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get "homes/about" => "homes#about"
  get "homes_about_path", to: "homes#about", as: :about_path
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
