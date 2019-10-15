Rails.application.routes.draw do
  devise_for :users
  root 'reviews#index'
  get 'favorites/index'
  resources :users
  get '/user_retire' => 'users#remove',as: 'user_retire'
  resources :reviews
  get '/page_about' => 'reviews#about',as: 'page_about'
  resources :favorites, only: [:create, :destroy]
  get '/tag_searched/:tag_name' => 'reviews#tag_searched',as: 'tag_searched'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
