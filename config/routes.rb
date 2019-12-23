Rails.application.routes.draw do
  devise_for :users
  root :to => "static_pages#home"
  get "home/about" , to: "static_pages#about"
  resources :users, :only => [:show, :index, :edit, :update]
  resources :books, :only => [:show, :index, :edit, :update, :destroy, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
