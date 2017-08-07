Rails.application.routes.draw do
  get 'sign_up',  to: 'users#new'
  post 'sign_up', to: 'users#create'
  get 'login',   to: 'sessions#new'
  post 'login',  to: 'sessions#create'
  delete 'logout',  to: 'sessions#destroy'
  root 'welcome#home'
  resources :surveys do
    resources :questions
  end

  resources :questions
  resources :users
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
