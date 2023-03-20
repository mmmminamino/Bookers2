Rails.application.routes.draw do
  devise_for :users
  root to:"homes#top"
  resources :users, only: [:show, :edit, :update, :index, :create, :news]
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit]
  
  get "/home/about" => "homes#about", as:"about"
  post 'users/:id' => 'users#show'
  
end
