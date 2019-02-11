Rails.application.routes.draw do
  post 'sessions/login'
  get 'sessions/home'
  get 'sessions/profile'
  get 'sessions/setting'
  post 'users/new'
  get 'welcome/index'
  
  resources :users
  resources :articles
  resources :sessions
  root 'sessions#login'
end
