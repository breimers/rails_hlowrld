Rails.application.routes.draw do
  get 'users/new'
  get 'welcome/index'
  
  resources :articles

  root 'welcome#index'

end
