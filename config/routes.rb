Rails.application.routes.draw do
  root 'application#root'
  post 'user_token' => 'user_token#create'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations"
  }
  namespace :api, path: '/' do
    resources :stocks
    resources :transactions
    resources :markets
  end
end
