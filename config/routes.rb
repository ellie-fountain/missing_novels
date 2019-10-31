Rails.application.routes.draw do
  devise_for :users
  root 'reviews#index'
  get 'favorites/index'
  resources :users do
  	get '/favorites' => 'users#favorites',as: 'favorites'
  	get '/admin_index/:id' => 'users#admin_index',as:'admin_index'
  	get '/histories' => 'users#histories', as:'histories'
  end
  get '/user_retire' => 'users#remove',as: 'user_retire'
  resources :reviews
  get '/page_about' => 'reviews#about',as: 'page_about'
  resources :favorites, only: [:create, :destroy]
  get '/tag_searched/:tag_name' => 'reviews#tag_searched',as: 'tag_searched'
  resources :categories, only:[:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
